{ get } = require 'http'

url = process.argv[2]

req = get url, (res) ->
	res.setEncoding 'utf8'

	text = []

	res.on 'data', (t) -> text.push t
	res.on 'error', console.error

	res.on 'end', ->
		text = text.join ''

		console.log text.length
		console.log text

req.on 'error', console.error
