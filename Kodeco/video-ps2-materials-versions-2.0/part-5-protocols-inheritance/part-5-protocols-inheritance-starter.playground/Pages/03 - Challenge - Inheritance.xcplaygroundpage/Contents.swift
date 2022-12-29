//: [⇐ Previous: 02 - Inheritance](@previous)
//: ## Episode 03: Challenge - Inheritance

/*:
## Challenge 1 - Building a Class Heirarchy
Create a class named `Animal` that has…
1. a function named `speak()` that does nothing.
 
Create two `Animal` subclasses...
1. `WildAnimal` that...
  - has an `isPoisonous` property, that is a `Bool`
  - has an initializer that takes `isPoisonous` as a parameter
2. `Pet` that...
  - has a stored property named `name`, that is a `String`
  - has an initializer that takes `name` as a parameter
  - has a `play()` method that prints out a message
  - overrides `speak()` - It should print out a message

Create one subclass of your choice of `WildAnimal` or `Pet`. It should do at least one of the following:
 - override `speak()`
 - override `play()`
 - Add a new computed property
 - Add a new method
*/


// TODO: Write solution here

class Animal {
    func speak() {
        print("Mmmm-ute")
    }
}

class WildAnimal: Animal {
    let isPoisonous: Bool
    init(_ isPoisonous: Bool) {
        self.isPoisonous = isPoisonous
    }
    func bite() {
        print("BITE!")
    }
}

class Pet: Animal {
    let name: String
    init(_ name: String) {
        self.name = name
    }
    func play() {
        print("So playful")
    }
    override func speak() {
        print("MeowWoofMoooooo")
    }
}

class Cat: Pet {
    override func speak() {
        print("Meowwwwww!")
    }
    override func play() {
        print("I slice and dice with my claws!")
    }
    func purr() {
        print("prrrrrrrrr")
    }
}


/*:
## Challenge 2 - Casting
- Create at least one instance of each class from the first challenge.
- Create an array that contains all of the instances.
- Write a function that takes an `Animal` and does something different depending on what subclass it is. Try using conditional downcasting!
- Call the function with each of your instances using a loop or whatever other method you'd like!
*/


// TODO: Write solution here


let aCat = Cat("Gata")
let aSnake = WildAnimal(true)
let aCutePet = Pet("Awww")
let anAnimal = Animal()

let animals = [aCat, aSnake, aCutePet, anAnimal]

print("************")

func doSomething(_ animal: Animal) {
    if let beast = animal as? Cat {
        print("\(beast.name)")
        beast.purr()
        return
    }
    if let beast = animal as? Pet {
        print("\(beast.name)")
        beast.play()
        return
    }
    if let beast = animal as? WildAnimal {
        beast.bite()
        return
    }
    if let beast = animal as? Animal {
        beast.speak()
        return
    }
}

for animal in animals {
    doSomething( animal )
}

