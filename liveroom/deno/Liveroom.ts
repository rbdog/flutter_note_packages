//
// RoomServer.ts
//

import { ApiRouter, ApiRouterServer } from "./ApiRouter.ts";

// イベント種類
const LiveAction = {
  join: 0,
  message: 1,
  exit: 2,
};

// ライブイベント
type LiveMail = {
  action: number;
  user_id: string;
  message: string;
};

// クライアント
type User = {
  id: string;
  socket: WebSocket;
};

// ルーム
type Room = {
  id: string;
  users: User[];
};

/// キーカード
type Keycard = {
  roomId: string;
  userId: string;
};

function createKeycard(searchParams: URLSearchParams): Keycard | null {
  // パラメータチェック
  const roomId = searchParams.get("room_id");
  const userId = searchParams.get("user_id");
  if (!roomId || !userId) {
    return null;
  } else {
    return {
      roomId: roomId,
      userId: userId,
    };
  }
}

const CreateResult = {
  alreadyExist: 0,
  success: 1,
};

const JoinResult = {
  roomNotFound: 0,
  alreadyJoined: 1,
  success: 2,
};

const SendResult = {
  roomNotFound: 0,
  sent: 1,
  notReadyConnected: 2,
  alreadyClosed: 3,
};

const ExitResult = {
  successKeepRoom: 0,
  roomNotFound: 1,
  successDeleteRoom: 2,
};

type Logger = (log: string) => void;

// ルームサーバー
export class Liveroom {
  // ルーム一覧
  rooms: Map<string, Room> = new Map();
  logger: Logger | null;

  constructor(logger: Logger | null = null) {
    this.logger = logger;
  }

  // 新しいルームを作成
  create(room_id: string, user: User): number {
    const room: Room = {
      id: room_id,
      users: [user],
    };
    if (this.rooms.get(room_id)) {
      return CreateResult.alreadyExist;
    }
    this.rooms.set(room_id, room);
    return CreateResult.success;
  }

  // ルームに参加
  join(room_id: string, user: User): number {
    // 対象のルームを見つける
    const room = this.rooms.get(room_id);
    if (!room) {
      return JoinResult.roomNotFound;
    }
    const oldUsers = room.users.findIndex((e) => e.id === user.id);
    if (oldUsers >= 0) {
      return JoinResult.alreadyJoined;
    }
    room.users.push(user);
    return JoinResult.success;
  }

  // ルームから退出
  exit(roomId: string, user_id: string): number {
    // 対象のルームを見つける
    const room = this.rooms.get(roomId);
    if (!room) {
      return ExitResult.roomNotFound;
    }
    // クライアントを削除
    room.users = room.users.filter((e) => e.id !== user_id);
    // クライアントが0人になったらルームを削除
    if (room.users.length === 0) {
      this.rooms.delete(roomId);
      return ExitResult.successDeleteRoom;
    } else {
      return ExitResult.successKeepRoom;
    }
  }

  // ライブイベントを送る
  sendLiveMail(liveEvent: LiveMail, room_id: string): number {
    // 対象のルームを見つける
    const room = this.rooms.get(room_id);
    if (!room) {
      return SendResult.roomNotFound;
    }
    // 全員に送信
    for (const user of room.users) {
      if (user.socket.readyState == WebSocket.CONNECTING) {
        // まだ接続中
        return SendResult.notReadyConnected;
      } else if (user.socket.readyState == WebSocket.OPEN) {
        // 接続できている
        const json = JSON.stringify(liveEvent);
        user.socket.send(json);
      } else {
        // 既に切断されていた
        this.exit(room_id, liveEvent.user_id);
        return SendResult.alreadyClosed;
      }
    }
    return SendResult.sent;
  }

  // クライアント1人ずつに対する処理
  clientHandler(room_id: string, user: User) {
    this.logger?.(`New join => Room: ${room_id}, User: ${user.id}`);
    // クライアントが接続したとき
    user.socket.onopen = () => {
      // 送信するメッセージ
      const mail: LiveMail = {
        action: LiveAction.join,
        user_id: user.id,
        message: "参加しました",
      };
      this.sendLiveMail(mail, room_id);
    };
    // クライアントからメッセージを受け取ったとき
    user.socket.onmessage = (event) => {
      // 送信するメッセージ
      const mail: LiveMail = {
        action: LiveAction.message,
        user_id: user.id,
        message: event.data,
      };
      this.sendLiveMail(mail, room_id);
    };
    // クライアントが切断したとき
    user.socket.onclose = () => {
      // 自動的に退出
      const result = this.exit(room_id, user.id);
      if (result == ExitResult.successKeepRoom) {
        // 送信するメッセージ
        const mail: LiveMail = {
          action: LiveAction.exit,
          user_id: user.id,
          message: "退出しました",
        };
        this.sendLiveMail(mail, room_id);
      }
    };
  }

  callCreateApi(req: Deno.RequestEvent): Response {
    const url = new URL(req.request.url);
    const keycard = createKeycard(url.searchParams);
    if (keycard === null) {
      return new Response("Error: パラメータが不足しています");
    }
    // WebSocket で接続
    const { socket, response } = Deno.upgradeWebSocket(req.request);
    // ルーム作成
    const user: User = {
      id: keycard.userId,
      socket: socket,
    };
    const result = this.create(keycard.roomId, user);
    if (result === CreateResult.alreadyExist) {
      // 失敗
      return new Response("Error: 既に同じルームIDが存在します");
    } else if (result === CreateResult.success) {
      this.clientHandler(keycard.roomId, user);
      return response;
    } else {
      return new Response("Error: 予期せぬエラーです");
    }
  }

  callJoinApi(req: Deno.RequestEvent): Response {
    const url = new URL(req.request.url);
    const keycard = createKeycard(url.searchParams);
    if (keycard === null) {
      return new Response("Error: パラメータが不足しています");
    }
    // WebSocket で接続
    const { socket, response } = Deno.upgradeWebSocket(req.request);
    // ルーム参加
    const user: User = {
      id: keycard.userId,
      socket: socket,
    };
    const result = this.join(keycard.roomId, user);
    if (result === JoinResult.roomNotFound) {
      // 失敗
      return new Response("Error: ルームIDが見つかりません");
    } else if (result === JoinResult.alreadyJoined) {
      // 失敗
      return new Response("Error: 既に参加中のユーザーIDです");
    } else if (result === JoinResult.success) {
      this.clientHandler(keycard.roomId, user);
      return response;
    } else {
      return new Response("Error: 予期せぬエラーです");
    }
  }
}

type LiveroomServerConfig = { port?: number; rootPath?: string };
const defaultConfig: LiveroomServerConfig = {
  port: 5000,
  rootPath: "/liveroom",
};

export class LiveroomServer {
  // API ルーター
  router = new ApiRouter();
  // LiveRoom
  liveroom = new Liveroom((log) => {
    console.log(log);
  });
  // Config
  config?: LiveroomServerConfig;

  constructor(config?: LiveroomServerConfig) {
    this.config = config;
  }

  // 起動
  run() {
    const rootPath = this.config?.rootPath ?? defaultConfig.rootPath!;
    this.router
      .get(rootPath, (req) => {
        return new Response("Hello from Liveroom");
      })
      .get(rootPath + "/create", (req) => {
        return this.liveroom.callCreateApi(req);
      })
      .get(rootPath + "/join", (req) => {
        return this.liveroom.callJoinApi(req);
      });

    const port = this.config?.port ?? defaultConfig.port!;
    const server = new ApiRouterServer(this.router, { port: port });
    server.run();
    this.liveroom.logger?.(`running on port ${port}`);
  }
}
