import Foundation

func solution(_ string: String) -> Int {
    let romanValues = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    
    let values = string.compactMap { romanValues[String($0)] }
    let decimalValues = zip(values.dropFirst().insert(0, at: 0), values).map { $0 < $1 ? -$0 : $0 }
    print(decimalValues)
    return decimalValues.reduce(0, +)
}


print( solution("MMMCMXIV") )
print( solution("MMXV") )
print( solution("CMXIV") )
print( solution("XI") )
