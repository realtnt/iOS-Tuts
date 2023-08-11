//: [Previous](@previous)

import Foundation

class Node {
    var data: Int
    var next: Node?
    init(_ data: Int) {
        self.data = data
    }
    
    func add(_ num: Int) {
        let node = Node(num)
        self.next = node
    }
}

func buildOneTwoThree() -> Node? {
    var head: Node? = nil
    var second: Node? = nil
    var third: Node? = nil
    
    head = Node(1)
    second = Node(2)
    third = Node(3)
    
    head?.next = second
    second?.next = third
    
    return head
}

func buildListFromArray(_ array: [Int]) -> Node? {
    var node: Node? = nil
    var head: Node? = nil
    for (index, element) in array.enumerated() {
        var previousNode = node
        node = Node(element)
        if index > 0 {
            previousNode?.next = node
        } else {
            head = node
        }
    }
    return head
}

enum LinkedListError: Error {
    case emptyList
    case outOfRange
}

func getNth(_ head: Node?, _ index: Int) throws -> Node? {
    guard var node = head else { throw LinkedListError.emptyList }

    for _ in 0..<index {
        guard let newNode = node.next else {
            throw LinkedListError.outOfRange
        }
        node = newNode
    }
    return node
}

let list:Node? = buildOneTwoThree()
let largeList:Node? = buildListFromArray([8, 4, 1, 2, 9, 4, 2, 8, 2])

if let node = try? getNth(list, 0) {
    print(node.data)
}

if let node = try? getNth(list, 1) {
    print(node.data)
}

if let node = try? getNth(list, 2) {
    print(node.data)
}

if let node = try? getNth(largeList, 0) {
    print(node.data)
}

//: [Next](@next)
