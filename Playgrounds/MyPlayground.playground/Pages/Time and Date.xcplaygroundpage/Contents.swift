//: [Previous](@previous)

import Foundation

let date = Date()
let dateFormatter = DateFormatter()

dateFormatter.dateFormat = "yyyy"

let yearString = dateFormatter.string(from: date)

print("The year as a String: \(yearString)")

let calendar = Calendar.current

var components = calendar.dateComponents([.year], from: date)
let year = components.year
print("This year is an Int: \(String(describing: year))")
print(components)

components.day = 22
components.month = 08
components.year = 1687
let notToday = Calendar.current.date(from: components)!
print("\(calendar.dateComponents([.year], from: components))")


//: [Next](@next)
