{ createServer    } = require 'http'
{ parse: urlparse } = require 'url'

explodeTime = (t) ->
	hour:   t.getHours()
	minute: t.getMinutes()
	second: t.getSeconds()

unixTime = (t) -> unixtime: t.getTime()

s = createServer (req, res) ->
	req.on 'error', console.error
	res.on 'error', console.error

	{ pathname: endpoint, query: { iso: t } } = urlparse req.url, true

	t = new Date t

	# invalid date
	if isNaN t.getTime()
		res.statusCode 404
		res.end()
		return

	res.writeHead 200, 'Content-Type': 'application/json'

	t = switch endpoint
		when '/api/parsetime' then explodeTime t
		when '/api/unixtime'  then unixTime t

	res.end JSON.stringify t

s.listen process.argv[2]
