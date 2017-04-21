{ createServer }     = require 'http'
{ createReadStream } = require 'fs'

[ port, file ] = process.argv[2..]

server = createServer (req, res) -> createReadStream(file).pipe res
server.listen port
