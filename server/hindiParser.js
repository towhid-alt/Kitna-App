const numbers = require('./parser_HI')

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
console.log(translateNumber("ektess"))
