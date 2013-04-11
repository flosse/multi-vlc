# multi-vlc

Control multiple VLC instances with only one web interface.

## Usage

### Start VLC instances

```shell
vlc --extraintf http
```

To run multiple instances on one host you can define different ports:

```shell
vlc --extraintf --http-port 8080
vlc --extraintf --http-port 8081
vlc --extraintf --http-port 8082

```
### Start the server

Write all your clients into `clients.js`, e.g:

```javascript
module.exports =
[
  { host: '192.168.11.3',  port:'8081' },
  { host: '192.168.11.3',  port:'8082' },
  { host: '192.168.11.99', port:'8080' }
]
```

Then run the server:

```
node lib/server.js
```

### Open webinterface

Open a browser and enter the IP address of your server
and append the port 3000, e.g. `http://192.168.0.100:3000`.

## License

This project is licensed unter the MIT license.
