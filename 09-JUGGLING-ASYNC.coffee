{ get } = require 'http'

text = []
done = 0

fetch = (i) ->
	req = get process.argv[2 + i], (res) ->
		data = []

		res.setEncoding 'utf8'

		res.on 'data', data.push.bind data
		res.on 'error', console.error
		res.on 'end', ->
			text[i] = data.join ''
			done++

			if done is 3
				console.log t for t in text

	req.on 'error', console.error

fetch i for i in [ 0 .. 2 ]
