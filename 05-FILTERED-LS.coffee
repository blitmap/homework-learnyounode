fs   = require 'fs'
path = require 'path'

[dir, ext] = process.argv[2..]

unless ext.startsWith '.'
	ext = ".#{ext}"

fs.readdir dir, (err, files) ->
	if err
		return console.error err

	console.log f for f in files when path.extname(f) is ext
