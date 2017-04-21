fs = require 'fs'

lineCount = (s) -> s.split('\n').length - 1

fs.readFile process.argv[2], 'utf8', (err, text) -> console.log err ? lineCount text
