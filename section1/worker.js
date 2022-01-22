const fs = require('fs');
const readline = require('readline');

const transform = (line) => {
  const [name, _price] = line.split(',')
  if (name === 'name' || _price === 'price') return ''
  if (!(name && _price)) return '';
  const cleanedName = name.replace(/(^|\s)(Ms\.?|Mrs\.?|Dr\.?|Miss|Mr\.?|DDS|DVM|MD|III|PhD|Jr\.?|II|IV)($|\s)/ig, '')
  const [first_name, last_name] = cleanedName.split(' ')
  const price = _price.replace(/^0+/, '')
  const above_100 = Number(price) > 100 ? 'true' : 'false'
  return [name, first_name, last_name, price, above_100].join(',') + '\r\n';
}

const processCsv = (inputPath, outputPath) => {
  const rd = readline.createInterface({
    input: fs.createReadStream(inputPath),
    output: process.stdout,
    console: false
  });

  const writer = fs.createWriteStream(outputPath, {
    flags: 'a'
  })
  writer.write('name,first_name,last_name,price,above_100\r\n')

  rd.on('line', function (line) {
    writer.write(transform(line));
  });
}

let inputFile = null
let outputFile = null

for (let i = 1; i < process.argv.length; i++) {
  if (process.argv[i - 1] === '-i') {
    inputFile = process.argv[i]
  }
  if (process.argv[i - 1] === '-o') {
    outputFile = process.argv[i]
  }
}

if (!inputFile || !outputFile) {
  console.log('Usage: node worker.js [options] [arguments]')
  console.log('Options:')
  console.log('  -i  Input csv filepath')
  console.log('  -o  Output csv filepath')
} else {
  processCsv(inputFile, outputFile)
}
