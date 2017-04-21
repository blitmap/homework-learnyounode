# DON"T JUDGE MEEEEEEEEE
String::willStartWith = (pre) -> @startsWith(pre) and @toString() or "#{pre}#{@}"
		
module.exports = (dir, ext, cb) ->
	{ readdir } = require 'fs'
	{ extname } = require 'path'

	ext = ext.willStartWith '.'

	readdir dir, (err, files) ->
		unless err?
			files = files.filter (f) -> extname(f) is ext

		cb err, files
