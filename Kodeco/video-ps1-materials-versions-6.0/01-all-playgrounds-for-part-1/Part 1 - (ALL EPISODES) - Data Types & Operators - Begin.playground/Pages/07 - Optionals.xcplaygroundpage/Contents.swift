//: [⇐ Previous: 06 - Challenge - Logical Operators](@previous)
//: ## Episode 07: Optionals
var petName: String?

petName = "Mango"
print(petName)

petName = nil

var result: Int? = 30
print(result)

petName = "Mango"
var petAge: Int? = 2
var unwrappedPetName = petName!

print("The pet's name is \(unwrappedPetName)")

if let petName = petName,
let petAge = petAge {
    
    print("\(petName), \(petAge)")
    
} else {
    print("no pet")
}

var optionalInt: Int? = nil

var requiredResult = optionalInt ?? 0

print(requiredResult)
//: [⇒ Next: 08 - Challenge - Optionals](@next)
