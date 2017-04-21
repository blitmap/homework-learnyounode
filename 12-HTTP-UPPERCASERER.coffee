{ createServer } = require 'http'
{ Transform }    = require 'stream'

class MapStream extends Transform
	constructor: (@f, opts = objectMode: true) -> super opts

	_transform: (chunk, enc, next) ->
		@push @f.apply chunk
		next()

UpStream = new MapStream String::toUpperCase

server = createServer (req, res) ->
	req.setEncoding 'utf8'

	req.on 'error', console.error
	res.on 'error', console.error

	req.pipe(UpStream).pipe res

server.listen process.argv[2]
