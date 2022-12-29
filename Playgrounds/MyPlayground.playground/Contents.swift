import UIKit

var heap: [UInt8] = Array(repeating: 0, count: 10 * 1024)

print(MemoryLayout.stride(ofValue: heap))

print(MemoryLayout.size(ofValue: heap))

print(heap.capacity)
