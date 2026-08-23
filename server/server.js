const express = require('express')
require('dotenv').config()
const numbers = require('./parser_HI')


const PORT = process.env.PORT || 3000;
const app = express()
app.use(express.json())

app.listen(PORT, () => console.log(`Server has started at port: ${PORT}`))

function matchingCharacters(a, b) {
    let count
    if (b>a || b===a){
         count = 0
        let a_length = a.length;
        let i =0
        while(i<a_length){
            if(a[i] === b[i]){
                count++
            }
            i++
        }
    } else if (b<a) {
         count = 0
        let b_length = b.length;
        let i =0
        while(i<b_length){
            if(b[i] === a[i]){
                count++
            }
            i++
        }
    }
    return count
}

function translateNumber(numberWord) {
    const matches = []
    let key_length
    for (let key of Object.keys(numbers)) { //TODO: Just change this line after addition of an if statement for other languages
        const result = matchingCharacters(numberWord, key)
        let in_length = numberWord.length
        key_length = key.length
        if (result >= in_length/2 && key_length <= in_length + 2) {
            matches.push({
                word: key,
                number: numbers[key],
                matchingCharacters: result
            })
        }
    }
    return matches
}

app.get('/api/results', async(req,res) => {
    console.log('📞Endpoint running...')//FIXME:
    try {
        
        const { numberWord } = req.query;
        console.log(`📞The value of req.query from the URL: ${numberWord}`)
        const results = translateNumber(numberWord)
        console.log(results)
        res.status(200).json( results )
    } catch (error) {
        console.error('Error fetching users:', error)
        res.status(500).json({ error: 'Internal server error' })
    }
})