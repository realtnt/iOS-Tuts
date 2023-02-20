import Foundation

enum Numbers {
    case one
    case ten
    case hundred
}

let number = Numbers.one

if case .one = number {
    print("one")
} else {
    print("not one")
}
