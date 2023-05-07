// deno run --allow-net https://deno.land/x/liveroom/quick.ts
import { LiveroomServer } from "./deno/Liveroom.ts";
const server = new LiveroomServer();
console.log('+----------+');
console.log('| Liveroom |');
console.log('+----------+');
server.run();
