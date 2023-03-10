//: [⇐ Previous: 07 - Challenge - Iterating Collections](@previous)
//: ## Episode 08: Nested Loops and Early Exit

let daysOfTheWeek: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

let poolTemperature: [Int] = [78, 81, 74, 80, 79, 83, 84]

for day in daysOfTheWeek {
    if day == "Monday" {
        continue
    }
    print(day)
    if day == "Thursday" {
        break
    }
}

//: [⇒ Next: 09 - Challenge - Nested Loops and Early Exit](@next)
