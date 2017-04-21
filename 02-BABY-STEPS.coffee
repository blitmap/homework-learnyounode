sum = (a) -> a.reduce ((x, y) -> x + y), 0

numbers = (process.argv[2..]).map Number

console.log sum numbers
