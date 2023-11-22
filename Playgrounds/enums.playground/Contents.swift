import UIKit

func func1() {
    enum Direction {
        case up, down, right, left
    }
    
    var latestMove = Direction.down
    
    print("\(#function) Latest move: \(latestMove)")
}

func func2() {
    enum Move: String {
        case up = "North"
        case down = "South"
        case right = "East"
        case left = "West"
    }
    
    var playerMove: Move = .right
    
    print("\(#function) Latest move: \(playerMove.rawValue)")
    
    print(type(of: playerMove.rawValue))
}

func func3() {
    enum Move: Int {
        case up, down, right, left
        
        var value: Int {
            return switch self {
            case .up, .right:
                1
            case .down, .left:
                -1
            }
        }
    }
    
    var playerMove: Move = .right
    
    print("\(#function) Latest move: \(playerMove)")
    print("\(#function) Latest move: \(playerMove.rawValue)")
    print("\(#function) Latest move: \(playerMove.value)")
    
    print(type(of: playerMove.rawValue))
}

func func4() {
    enum Ordinal: Int, CaseIterable {
        case second = 2, third, fourth, fifth, sixth, seventh
    }
    
    var timsPlace = Ordinal.fifth
    print("\(#function) Tim's place: \(timsPlace) (\(timsPlace.rawValue))")
    
    for place in Ordinal.allCases {
        print(place)
    }
}

func func5() {
    enum Barcode: Equatable {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
        
        func barcodeString() -> String {
            return switch self {
                case .upc(let a, let b, let c, let d):
                    "\(a)\(b)\(c)\(d)"
                case .qrCode(let stringValue):
                    stringValue
            }
        }
    }
    
    let barcode = Barcode.upc(1, 12345, 12345, 8)
    let qrcode = Barcode.qrCode("SAFREG£$£$GERGSDVASCCRV£$")
    
    print(barcode.barcodeString())
    print(qrcode.barcodeString())
}

func func6() {
    enum Dice: Int {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        var roll: Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    for _ in 1...10 {
        print("100-sided die:", Dice.hundred.roll)
        print("20-sided die:", Dice.twenty.roll)
    }
}

func6()
