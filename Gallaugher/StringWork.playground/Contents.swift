import UIKit

let word = "SWIFT"

var revealWord = ""

for _ in word {
    revealWord += "_ "
}

revealWord.removeLast()
print(revealWord)

String(repeating: " _", count: word.count)
