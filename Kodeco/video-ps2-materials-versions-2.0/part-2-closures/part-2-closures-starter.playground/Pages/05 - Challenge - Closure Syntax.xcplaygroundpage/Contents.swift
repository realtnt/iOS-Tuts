//: [⇐ Previous: 04 - Closure Syntax](@previous)
//: ## Episode 05: Challenge - Closure Syntax

/*:
 ## Challenge 1
 Rewrite the long closure with the following syntax:
  * No parameter types
  * No parameter or return types
  * No parameter names
 Try passing the same values into each closure. Their printed results should match!
*/

// --------------------------------------
let copyLines = { (offense: String, repeatCount: Int) -> Void in
  print( String(repeating: "I must not \(offense).", count: repeatCount) )
}
// --------------------------------------

// TODO: Write solution here

typealias Offense = (String, Int) -> Void

let copyLinesNoParamTypes: Offense = { offense, repeatCount -> Void in
  print( String(repeating: "I must not \(offense).", count: repeatCount) )
}

copyLinesNoParamTypes("run", 10)

let copyLinesNoTypes: Offense = { a, b in
    print( String(repeating: "I must not \(a).", count: b) )
}

copyLinesNoTypes("jump", 5)

let copyLinesNoTypesNoNames: Offense = {
    print( String(repeating: "I must not \($0).", count: $1) )
}

copyLinesNoTypesNoNames("walk", 3)


//: [⇒ Next: 06 - forEach and map](@next)
