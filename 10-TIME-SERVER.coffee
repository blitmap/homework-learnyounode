{ createServer } = require 'net'

pad = (n) -> n < 10 and "0#{n}" or n

server = createServer (s) ->
	dt = new Date

	Y =     dt.getFullYear()
	M = pad dt.getMonth() + 1
	D = pad dt.getDate()
	h = pad dt.getHours()
	m = pad dt.getMinutes()

	s.end "#{Y}-#{M}-#{D} #{h}:#{m}\n"

server.listen process.argv[2]
