//: [⇐ Previous: 02 - Tuples](@previous)
//: ## Episode 03: Challenge - Tuples


/*:
 ### TUPLES
 
 Declare a constant tuple named specialDate that contains three Int values followed by a String. Use this to represent a date (month, day, year) followed by a word you might associate with that day.
 */

// TODO: Write solution here

let specialDate = (1, 12, 1972, "Birthday")
//
//let (day, month, year, event) = specialDate
//print(day, month, year, event)
/*:
 Create another tuple, but this time name the constituent components. Give them names related to the data that they contain: month, day, year and description.
 */


// TODO: Write solution here



/*:
 In one line, read the day and description values into two constants. You’ll need to use the underscore to ignore the month and year.
 */

// TODO: Write solution here
let (day, _, _, event) = specialDate

print(day, event)

/*:
 Up until now, you’ve only seen constant tuples. But you can create variable tuples, too. Create one more tuple, like in the exercises above, but this time use var instead of let. Now change the day to a new value. */

// TODO: Write solution here

var firstTuple = (1, 2)
var firstArray = [3, 4]

var secondTuple: (Int, Int)
var secondArray: [Int]

secondTuple = firstTuple
secondArray = firstArray

print(secondTuple.0, secondTuple.1)
print(secondArray[0], secondArray[1])

firstTuple.0 = 11
print(secondTuple.0, secondTuple.1)
print(firstTuple)

firstArray[0] = 13
print(secondArray[0], secondArray[1])

//: [⇒ Next: 04 - Arrays](@next)
