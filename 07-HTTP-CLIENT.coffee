{ get } = require 'http'

url = process.argv[2]

req = get url, (res) ->
	res.setEncoding 'utf8'
	res.on 'data',  console.log
	res.on 'error', console.error

req.on 'error', console.error
