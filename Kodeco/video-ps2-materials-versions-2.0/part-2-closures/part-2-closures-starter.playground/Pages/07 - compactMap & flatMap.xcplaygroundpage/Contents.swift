//: [⇐ Previous: 06 - forEach & map](@previous)
//: ## Episode 07: compactMap & flatMap

//: `compactMap`

// --------------------------------------
let userInput = ["meow!", "15", "37.5", "seven"]
// --------------------------------------


var arrayForValidInput: [Int] = []

for input in userInput {
    guard let input = Int(input) else {
        continue
    }
    arrayForValidInput.append(input)
}
arrayForValidInput

let validInput = userInput.compactMap { Int($0) }

print( validInput )

// --------------------------------------
let arrayOfDwarfArrays = [
  ["Sleepy", "Grumpy", "Doc", "Bashful", "Sneezy"],
  ["Thorin", "Nori", "Bombur"]
]
// --------------------------------------

let flatArray = arrayOfDwarfArrays.flatMap { $0.compactMap { $0 > "M" ? $0 : nil } }

print( flatArray )
//: [⇒ Next: 08 - Challenge: Closures & Collections](@next)
