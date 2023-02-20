import Foundation

let url = URL(string: "https://en.something.com/1/2")!

print(url)
print(url.pathComponents.count)
if url.pathComponents.count > 1 {
    let firstPathComp = url.pathComponents[1]
    print(firstPathComp)
}
