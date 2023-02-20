import Foundation

class Animal {
    var name: String
    init(n: String) {
        name = n
    }
}

class Human: Animal {
    func code() {
        print("Typing away...")
    }
}

class Fish: Animal {
    func breatheUnderwater() {
        print("Breathing under water.")
    }
}


let theo = Human(n: "Theo")
let jim = Human(n: "Jim")
let nemo = Fish(n: "Nemo")

