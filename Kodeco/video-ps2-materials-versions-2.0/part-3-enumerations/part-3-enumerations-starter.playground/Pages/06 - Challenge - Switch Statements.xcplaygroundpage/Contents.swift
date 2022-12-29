//: [⇐ Previous: 05 - More Switch Statements](@previous)
//: ## Episode 06: Challenge - Switch Statements

/*:
 ## Challenge 1
 - Write a switch statement that switches on a tuple containing a `String` and an `Int`. The `String` is a name, and the `Int` is an age.
 - Use the cases below (or make up your own), and binding with `let` syntax, to assign the the name, followed by the life stage related to the age, to a `String` constant.
 
 For example, for the author of these challenges, you'd assign "Matt is an adult." to your constant.
 
 * 0-2 years: Infant
 * 3-12 years: Child
 * 13-19 years: Teenager
 * 20-39: Adult
 * 40-60: Middle aged
 * 61+: Elderly
*/

// TODO: Write solution here

func lifeStage(_ person: (String, Int)) -> String? {
    var stage: String
    
    switch person {
    case (_, 0...2):
        stage = "an infant"
    case (_, 3...12):
        stage = "a child"
    case (_, 13...19):
        stage = "a teenager"
    case (_, 20...39):
        stage = "an adult"
    case (_, 40...60):
        stage = "middle aged"
    case (_, let age) where age > 61:
        stage = "elderly"
    default:
        return nil
    }
    return person.0 + " is " + stage
}

print( lifeStage(("John", 3)) ?? "Invalid age" )
print( lifeStage(("John", 30)) ?? "Invalid age" )
print( lifeStage(("John", 48)) ?? "Invalid age" )
print( lifeStage(("John", 13)) ?? "Invalid age" )
print( lifeStage(("John", 93)) ?? "Invalid age" )



/*:
 ## Challenge 2
 Imagine starting a new level in a video game. The character makes a series of movements in the game. Calculate the position of the character on a top-down level map after making a set of movements.
 - Create a `Direction` enumeration with cases for `north`, `south`, `east`, and `west`.
 - Write a function that takes a `Direction` array and returns a tuple of two Ints representing the character's location after all of the movements.
 - Assume the character starts at (0, 0)
 
 Example: A series of movements like [.north, .west, .west] would return a location of (-2, 1)
*/

// TODO: Write solution here


enum Direction {
    case north
    case south
    case east
    case west
}

func getCoords(for moves: [Direction] ) -> (x: Int, y: Int) {
//    var location = (x: 0, y: 0)
//
//    for move in moves {
//        switch move {
//        case .north:
//            location.y += 1
//        case .south:
//            location.y -= 1
//        case .east:
//            location.x += 1
//        case .west:
//            location.x -= 1
//        }
//    }
//    return location
    moves.reduce(into: (x: 0, y: 0)) { (location, move) in
        switch move {
        case .north:
            location.y += 1
        case .south:
            location.y -= 1
        case .east:
            location.x += 1
        case .west:
            location.x -= 1
        }
    }
}

print( getCoords(for: [.north, .west, .west, .west] ) )


//: [⇒ Next: 07 - Associated Values](@next)
