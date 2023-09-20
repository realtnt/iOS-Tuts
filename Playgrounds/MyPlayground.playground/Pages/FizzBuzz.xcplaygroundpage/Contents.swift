//import Foundation

func fizzBuzzIfMethod(from start: Int, to end: Int) {
    (start...end).forEach { number in
        if number.isMultiple(of: 15) {
            print("FizzBuzz")
        } else  if number.isMultiple(of: 3) {
            print("Fizz")
        } else if number.isMultiple(of: 5) {
            print("Buzz")
        } else {
            print(number)
        }
    }
}

func fizzBuzzBadNestedTernary(from start: Int, to end: Int) {
    (start...end).forEach { number in
        number.isMultiple(of: 15) ? print("FizzBuzz")
        :number.isMultiple(of: 3) ? print("Fizz")
        :number.isMultiple(of: 5) ? print("Buzz")
        :print(number)
    }
}

func fizzBuzzTernary(from start: Int, to end: Int) {
    (start...end).forEach { number in
        let fizz = number.isMultiple(of: 3) ? "Fizz" : ""
        let buzz = number.isMultiple(of: 5) ? "Buzz" : ""
        print((fizz+buzz).isEmpty ? "\(number)" : fizz+buzz)
    }
}

func fizzBuzzStrings(from start: Int, to end: Int) {
    (start...end).forEach { number in
        var fizz = "", buzz = "", numberString = ""
        if number.isMultiple(of: 3) {
            fizz = "Fizz"
        }
        
        if number.isMultiple(of: 5) {
            buzz = "Buzz"
        }
        
        if (fizz+buzz).isEmpty {
            numberString = String(number)
        }
        print(fizz+buzz+numberString)
    }
}

func fizzBuzzStrings2(from start: Int, to end: Int) {
    (start...end).words.forEach { number in
        var fizz {
            number.isMultiple(of: 3) ? 
        }
    }
}

func fizzBuzzFunctional(from start: Int, to end: Int) {
    (start...end).forEach {
        print("""
\($0.isMultiple(of: 3) ? "Fizz" : "")\($0.isMultiple(of: 5) ? "Buzz" : "")\($0.isMultiple(of: 3) || $0.isMultiple(of: 5) ? "" : String($0))
"""
        )
    }
}

func fizzBuzzTuple(from start: Int, to end: Int) {
    (start...end).forEach { number in
        let tuple = ( number.isMultiple(of: 3), number.isMultiple(of: 5))
        switch tuple {
        case (true, true):
            print("FizzBuzz")
        case (true, _):
            print("Fizz")
        case (_, true):
            print("Buzz")
        default:
            print(number)
        }
    }
}

func fizzBuzzTuple2(from start: Int, to end: Int) {
    (start...end).forEach { number in
        let tuple = ( number.isMultiple(of: 3), number.isMultiple(of: 5))
        var fizz = "", buzz = "", numberString = ""
        switch tuple {
        case (true, _):
            fizz = "Fizz"
        case (_, true):
            buzz = "Buzz"
        default:
            numberString = String(number)
        }
        print(fizz+buzz+numberString)
    }
}

fizzBuzzTuple2(from: 1, to: 10)
