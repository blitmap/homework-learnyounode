ls = require './06-MAKE-IT-MODULAR-module'

[dir, ext] = process.argv[2..]

ls dir, ext, (err, files) ->
	if err
		return console.log err

	console.log f for f in files
