//: [Previous](@previous)

import Foundation

class Node {
    var data: Int
    var next: Node?
    init(_ data: Int) {
        self.data = data
    }
}

func removeDuplicates(head:Node?) -> Node? {
    guard var node = head else { return nil }
    while node.next != nil {
        var nextNode = node.next
        if node.data == nextNode?.data {
            node.next = nextNode?.next
            node = node.next!
        }
    }
    return head
}

//: [Next](@next)
