fs = require 'fs'

lineCount = (s) -> s.split('\n').length - 1

text = fs.readFileSync process.argv[2], 'utf8'

console.log lineCount text
