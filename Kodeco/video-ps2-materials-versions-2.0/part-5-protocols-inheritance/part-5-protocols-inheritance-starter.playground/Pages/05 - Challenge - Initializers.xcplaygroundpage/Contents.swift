//: [⇐ Previous: 04 - Initializers](@previous)
//: ## Episode 05: Challenge: Initializers

/*:
 ## Challenge 1 😃
 Create a class named `Animal` that has…
 1. a single stored property named `name`, that is a `String`
 2. a required initializer that takes `name` as a parameter
 3.  a function `speak()` that does nothing.
 */

// TODO: Write solution here
class Animal {
    var name: String

    required init(_ name: String) {
        self.name = name
    }

    func speak() { }
}
/*:
 Create a class named `Dog` that…
 1. inherits from `Animal`
 2. has a property that stores how many tricks it has learned
 3. implements the required initializer, defaulting the trick count to `0`, and calling `speak()` at the end
 4. overrides the function `speak()` to greet you and says its name
 */

// TODO: Write solution here

class Dog: Animal {
    var numberOfTricks: Int

    required convenience init(_ name: String) {
        self.init(name, numTricksLearned: 0)
    }

    convenience init(name: String = "Azor", numTricksLearned: Int = .max) {
        self.init(name, numTricksLearned: numTricksLearned)
    }

    init(_ name: String, numTricksLearned: Int) {
        self.numberOfTricks = numTricksLearned
        super.init(name)
        speak()
    }

    override func speak() {
        print("Hi! My name is \(self.name)")
    }
}

let doggie = Dog("Doggie")
let azor = Dog()

print("\(azor.name) knows \(azor.numberOfTricks) tricks")
print("\(doggie.name) knows \(doggie.numberOfTricks) tricks")
/*:
 Add a second (non-required) initializer to `Dog` that takes both the `name` and `numTricksLearned` as parameters. Then call this initializer from the required initializer.
 */

/*:
 Add a convenience initializer to `Dog` that defaults the dog's name to your favorite dog's name, with however many tricks the dog has learned.
 */

//: [⇒ Next: 06 - Protocols](@next)

