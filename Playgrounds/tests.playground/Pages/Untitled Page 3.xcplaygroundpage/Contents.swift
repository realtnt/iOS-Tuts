//: [Previous](@previous)

import Foundation
// TODO: define the 'remainingMinutesInOven' function
func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
    return expectedMinutesInOven - elapsedMinutes
}

// TODO: define the 'preparationTimeInMinutes' function
func preparationTimeInMinutes(layers: String...) -> Int {
    return layers.count * 2
}

// TODO: define the 'quantities' function
func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
    let layersDict = getElementCount(layers)
    return (noodles: (layersDict["noodles"] ?? 0) * 3, sauce: Double(layersDict["sauce"]  ?? 0) * 0.2)
}

// TODO: define the 'toOz' function
func toOz(_ amount: inout (noodles: Int, sauce: Double)) {
    amount.sauce *= 33.814
}

// TODO: define the 'redWine' function
func redWine(layers: String...) -> Bool {
    func mozzarella(_ layers: [String]) -> Int {
        return getElementCount(layers)["mozzarella"] ?? 0
    }
    func bechamel(_ layers: [String]) -> Int {
        return getElementCount(layers)["béchamel"] ?? 0
    }
    func ricotta(_ layers: [String]) -> Int {
        return getElementCount(layers)["ricotta"] ?? 0
    }
    func meat(_ layers: [String]) -> Int {
        return getElementCount(layers)["meat"] ?? 0
    }
    func sauce(_ layers: [String]) -> Int {
        return getElementCount(layers)["sauce"] ?? 0
    }
    
    return meat(layers) + sauce(layers) >= mozzarella(layers) + bechamel(layers) + ricotta(layers)
}

func getElementCount(_ array: [String]) -> [String:Int] {
    return array.reduce(into: [:]) { count, char in
        count[char, default: 0] += 1
    }
}

remainingMinutesInOven(elapsedMinutes: 30)
// => 10
remainingMinutesInOven(elapsedMinutes: 30, expectedMinutesInOven: 75)
// => 45


preparationTimeInMinutes(layers: "sauce", "noodles")
// => 4
preparationTimeInMinutes(layers: "sauce", "noodles", "sauce", "meat", "mozzarella", "noodles", "sauce", "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
// => 24


quantities(layers: "sauce", "noodles", "sauce", "meat", "mozzarella", "noodles", "sauce", "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
// => (noodles 9, sauce 0.8)
let lasagna2 = quantities(layers: "sauce", "noodles", "sauce", "noodles", "meat", "noodles", "mozzarella")
// => (noodles 9, sauce 0.4)
print("noodles = \(lasagna2.noodles) sauce = \(lasagna2.sauce)")

var amount = (noodles: 9, sauce: 0.8)
toOz(&amount)
// => amount is now (noodles: 9, sauce: 27.0512)


redWine(layers: "sauce", "noodles", "sauce", "meat", "mozzarella", "noodles", "sauce", "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
// => true
redWine(layers: "sauce", "noodles", "béchamel", "meat", "mozzarella", "noodles", "ricotta", "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
// => false

//: [Next](@next)
