//
// Required
//   - 1. instance of Liveroom
//   - 2. API GET "/liveroom/create" => liveroom.callCreateApi(req);
//   - 3. API GET "/liveroom/join" => liveroom.callJoinApi(req);
//
import { Liveroom } from "./Liveroom.ts";

// 1. instance
const liveroom = new Liveroom();

function onRequest(req: Deno.RequestEvent, path: string) {
  // 2. API
  if (req.request.method === "GET" && path === "/liveroom/create") {
    const response = liveroom.callCreateApi(req);
    req.respondWith(response);
  }

  // 3. API
  if (req.request.method === "GET" && path === "/liveroom/join") {
    const response = liveroom.callJoinApi(req);
    req.respondWith(response);
  }

  //
  // ...Your other APIs
  //
}

// Start Deno Server
const server = Deno.listen({ port: 5000 });
for await (const conn of server) {
  const httpConn = Deno.serveHttp(conn);
  for await (const req of httpConn) {
    const url = new URL(req.request.url);
    onRequest(req, url.pathname);
  }
}

// deno run --allow-net main.ts
