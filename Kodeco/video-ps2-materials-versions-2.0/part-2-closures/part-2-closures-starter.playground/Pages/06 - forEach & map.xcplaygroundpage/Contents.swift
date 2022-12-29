//: [⇐ Previous: 05 - Challenge - Closure Syntax](@previous)
//: ## Episode 06: forEach & map
import Foundation

// --------------------------------------
var prices = [1.50, 10.00, 4.99, 2.30, 8.19]
// --------------------------------------

//: `forEach` - Loops over a collection and performs an operation
for price in prices {
    print(price)
}

prices.forEach { print($0) }

//: `map` - Loops over an array, executes closure code, returns a new array
var arrayForSalePrices: [Double] = []
for price in prices {
    arrayForSalePrices.append(price * 0.9)
}
arrayForSalePrices

let salesPrices = prices.map { $0 * 0.9 }

let priceLabels = salesPrices.map { String(format: "%.2f", $0) }

priceLabels.forEach { print($0) }

//: [⇒ Next: 07 - compactMap & flatMap](@next)
