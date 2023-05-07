## Blueprint For Developers

WebSocket URL

| API         | URL                                                                 |
| ----------- | ------------------------------------------------------------------- |
| Create Room | ws://localhost:5000/liveroom/create?room_id=ROOM_ID&user_id=USER_ID |
| Join Room   | ws://localhost:5000/liveroom/join?room_id=ROOM_ID&user_id=USER_ID   |

Data Message Format

```
{
  "action": "message",
  "user_id": "MY_USER_ID",
  "message": "Hello from MY_USER_ID"
}
```
