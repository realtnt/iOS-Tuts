//: [⇐ Previous: 04 - Switch Statements](@previous)
//: ## Episode 05: More Switch Statements

//: Switching on values
func getDescription(for number: Int) -> String {
    switch number {
    case 0:
        return "Zero"
    case 1...9:
        return "Between 1 and 9"
    case let negativeNumber where negativeNumber < 0:
        return "Negative"
    default:
        return "No Description"
    }
}

getDescription(for: 10)
getDescription(for: -10)



//: Switching on expressions




//: Switching on multiple values





//: [⇒ Next: 06 - Challenge - Switch Statements](@next)

