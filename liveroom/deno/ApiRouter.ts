//
// ApiRouter.ts
//

// 汎用 APIルーター

type ApiProcess = (req: Deno.RequestEvent) => Response;

type ApiRoute = {
  method: string;
  path: string;
  process: ApiProcess;
};

export class ApiRouter {
  routes: ApiRoute[] = [];
  get(path: string, process: ApiProcess): ApiRouter {
    const route: ApiRoute = {
      method: "GET",
      path: path,
      process: process,
    };
    this.routes.push(route);
    return this;
  }

  post(path: string, process: ApiProcess): ApiRouter {
    const route: ApiRoute = {
      method: "POST",
      path: path,
      process: process,
    };
    this.routes.push(route);
    return this;
  }
}

type ApiRouterServerConfig = { port?: number };
const defaultConfig: ApiRouterServerConfig = {
  port: 5000,
};

export class ApiRouterServer {
  // Router
  router: ApiRouter;
  // Config
  config?: ApiRouterServerConfig;

  constructor(router: ApiRouter, config?: ApiRouterServerConfig) {
    this.router = router;
    this.config = config;
  }

  // Http リクエスト 1つずつに対する処理
  requestHandler(req: Deno.RequestEvent) {
    const url = new URL(req.request.url);
    for (const route of this.router.routes) {
      if (req.request.method === route.method && url.pathname === route.path) {
        const res = route.process(req);
        req.respondWith(res);
      }
    }
  }

  // 全ての Http 接続に対する処理
  async connHandler(conn: Deno.Conn) {
    const httpConn = Deno.serveHttp(conn);
    for await (const requestEvent of httpConn) {
      this.requestHandler(requestEvent);
    }
  }

  // 起動
  async run() {
    const port = this.config?.port ?? defaultConfig.port!;
    const server = Deno.listen({ port: port });
    for await (const conn of server) {
      this.connHandler(conn);
    }
  }
}
