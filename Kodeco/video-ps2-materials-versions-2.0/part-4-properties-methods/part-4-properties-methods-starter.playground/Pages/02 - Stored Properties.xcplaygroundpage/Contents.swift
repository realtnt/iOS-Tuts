//: [⇐ Previous: 01 - Introduction](@previous)
//: ## Episode 02: Stored Properties

struct Wizard {
    static var commonMagicalIngredients = [
    "spider",
    "nettles"
    ] {
        didSet {
            print("Yoohoo changed")
        }
    }
    
    var firstName: String {
        willSet {
            print(firstName + " will be set to " + newValue)
        }
        didSet {
            if firstName.contains(" ") {
                print("No space allowed! \(firstName) is not a first name. Reverting to \(oldValue).")
                firstName = oldValue
            }
        }
    }
    var lastName: String
    
    var fullName: String { "\(firstName) \(lastName)" }
}


var wizard = Wizard(firstName: "Gandalf", lastName: "Greyjoy")

wizard.firstName = "Hermione"
wizard.lastName = "Kenobi"

wizard.firstName = " Merlin"

Wizard.commonMagicalIngredients

Wizard.commonMagicalIngredients[0] = "asdf"

//: [⇒ Next: 03 - Computed Properties](@next)
