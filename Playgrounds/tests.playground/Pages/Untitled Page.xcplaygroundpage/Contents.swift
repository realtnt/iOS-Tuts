let flip = { (wires: (String, String, String)) -> (String, String, String) in
    (wires.1, wires.0, wires.2)
}

let rotate = { (wires: (String, String, String)) -> (String, String, String) in
    (wires.1, wires.2, wires.0)
}

let decToBin = { (number: UInt8) -> [UInt8] in
    var bitsArray: [UInt8] = []
    var remainder = number
    while remainder != 0 {
        bitsArray.insert(remainder % 2, at: 0)
        remainder /= 2
    }
    while bitsArray.count < 8 {
        bitsArray.insert(0, at: 0)
    }
    return bitsArray
}

func makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> (UInt8, (String, String, String)) -> (String, String, String) {
  return { (id: UInt8, wires: (String, String, String)) -> (String, String, String) in
    let bits = decToBin(id)
    var newWireOrder = wires
      for bit in bits.reversed() {
        if bit == 0 {
            newWireOrder = flipper(newWireOrder)
        } else {
            newWireOrder = rotator(newWireOrder)
        }
    }
    return newWireOrder
  }
}

let shuffler = makeShuffle(flipper: flip, rotator: rotate)

let wires = ("Purple", "Cyan", "Marigold")
let expected = ("Marigold", "Cyan", "Purple")
let got = shuffler(253, wires)

print(got)

extension UInt8 {
    /// This function returns the bits of the number as an array of `UInt8` zeroes (`0`) and ones(`1`)
    func bits() -> [UInt8] {
        (0...7).map({i in (self >> i) & 1})
    }
}
