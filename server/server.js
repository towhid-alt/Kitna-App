const express = require('express')
require('dotenv').config()
const numbers = require('./parsersLib/parser_HI')
const numbers_BEN = require('./parsersLib/parser_BEN')
const cors = require('cors')


const PORT = process.env.PORT || 3000;
const app = express()
app.use(cors());
app.use(express.json())

app.listen(PORT, () => console.log(`Server has started at port: ${PORT}`))

function matchingCharacters(a, b) {
    let count = 0;

    const length = Math.min(a.length, b.length);

    for (let i = 0; i < length; i++) {
        if (a[i] === b[i]) {
            count++;
        }
    }

    return count;
}

function translateNumber(numberWord, language) {
    const matches = []
    let key_length
    if (language === 'Hindi') {
        for (let key of Object.keys(numbers)) { //TODO: Just change this line after addition of an if statement for other languages
            const result = matchingCharacters(numberWord, key)
            let in_length = numberWord.length
            key_length = key.length
            if (result >= in_length / 2 && key_length <= in_length + 2) {
                matches.push({
                    word: key,
                    number: numbers[key],
                    matchingCharacters: result
                })
            }
        }
    } else if (language === 'Bengali') {
        let in_length = numberWord.length
        let condition = Math.floor(in_length / 2) //Round down

        for (let key of Object.keys(numbers_BEN)) {
            const result = matchingCharacters(numberWord, key)
            key_length = key.length

            if (result >= condition && key_length <= in_length + 2) {
                matches.push({
                    word: key,
                    number: numbers_BEN[key],
                    matchingCharacters: result
                })
            }
        }
    }

    return matches
}

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

app.get('/api/results', async (req, res) => {
    try {
        const { numberWord, language } = req.query;
        const results = translateNumber(numberWord, language)
        console.log(results)
        res.status(200).json(results)
    } catch (error) {
        console.error('Error fetching users:', error)
        res.status(500).json({ error: 'Internal server error' })
    }
})