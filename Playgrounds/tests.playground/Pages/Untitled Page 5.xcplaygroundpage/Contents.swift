//: [Previous](@previous)

func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    guard let diameter,
          let slices,
          diameter > 0,
          slices > 1
    else { return nil }
    let r = diameter / 2.0
    return Double.pi * r * r / Double(slices)
}

sliceSize(diameter: 16, slices: 10)

let a = "asdf"

let b = Double(a)

//: [Next](@next)
