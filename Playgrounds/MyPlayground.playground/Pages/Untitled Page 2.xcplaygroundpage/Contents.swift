import Foundation

func elementExists2(array: [Int], element: Int) -> Bool {
    guard array.count > 0 else { return false }
    if array.count == 1 {
        return array[0] == element
    }
    if array.first! > element || array.last! < element {
        return false
    }
    
    let middle = array.count / 2

    return if array[middle] == element {
        true
    } else if array.count == 1 {
        false
    } else if array[middle] < element {
        elementExists(array: Array(array[middle ..< array.endIndex]), element: element)
    } else {
        elementExists(array: Array(array[0 ..< middle]), element: element)
    }
}

func elementExistsLin(array: [Int], element: Int) -> Bool {
    guard array.count > 0 else { return false }
    for el in array {
        if el == element {
            return true
        } else if el > element {
            return false
        }
    }
    
    return false
}

func elementExists(array: [Int], element: Int) -> Bool {
    print(array, element)
    guard array.count > 0 else { return false }
    var left = 0
    var right = array.count - 1
    
    while left < right {
        let middle = (left + right) / 2
        let midValue = array[middle]
        if midValue == element {
            return true
        } else if midValue > element {
            right = middle - 1
        } else {
            left = middle + 1
        }
    }
    
    return array[left] == element
}
print(elementExists(array: [], element: 3))
print(elementExists(array: [1], element: 1))
print(elementExists(array: [1], element: 2))


print(elementExists(array: [1,2,3,4], element: 1))
print(elementExists(array: [1,2,3,4], element: 2))
print(elementExists(array: [1,2,3,4], element: 3))
print(elementExists(array: [1,2,3,4], element: 4))
print(elementExists(array: [1,2,3,4,5], element: 1))
print(elementExists(array: [1,2,3,4,5], element: 2))
print(elementExists(array: [1,2,3,4,5], element: 3))
print(elementExists(array: [1,2,3,4,5], element: 4))
print(elementExists(array: [1,2,3,4,5], element: 5))
print(elementExists(array: [1,2,3,4], element: -1))
print(elementExists(array: [1,2,3,4], element: -2))
print(elementExists(array: [1,2,3,4], element: -3))
print(elementExists(array: [1,2,3,4], element: -4))
print(elementExists(array: [1,2,3,4], element: -1))
print(elementExists(array: [1,2,3,4,5], element: 22))
print(elementExists(array: [1,2,3,4,5], element: 33))
print(elementExists(array: [1,2,3,4,5], element: 44))
print(elementExists(array: [1,2,3,4,5], element: 55))
print(elementExists(array: [1,2,3,4,5,6,7,8,9], element: 19))
print(elementExists(array: [1,2,3,4,5,6,7,8,9], element: 1))
print(elementExists(array: [1,2,3,4,5,6,7,8,9,10], element: 5))

