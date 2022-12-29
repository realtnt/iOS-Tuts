//: [⇐ Previous: 05 - Challenge - For Loops](@previous)
//: ## Episode 06: Iterating Collections

let daysOfTheWeek: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

let poolTemperature: [Int] = [78, 81, 74, 80, 79, 83, 84]

for i in 0..<daysOfTheWeek.count {
    print(daysOfTheWeek[i])
}

for i in 0..<poolTemperature.count {
    print(poolTemperature[i])
}

for day in daysOfTheWeek {
    print(day)
}

for temp in poolTemperature where temp > 80 {
    print(temp)
}
//: [⇒ Next: 07 - Challenge - Iterating Collections](@next)
