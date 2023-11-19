import Foundation

// Q1

let swiftStudents = [
    "Holt B.",
    "Luke B.",
    "Michael B.",
    "Milan C.",
    "Russell C.",
    "Gabriela C.",
    "Kevin C.",
    "Charles C.",
    "Matthew C.",
    "Gleidson D.",
    "Jack D.",
    "John G.",
    "Matthew Gr.",
    "Matthew Gu.",
    "William H.",
    "Shane J.",
    "Connor J.",
    "Andy J.",
    "Christopher K.",
    "Dylan K.",
    "Riya K.",
    "Aakash K.",
    "Benjamin L.",
    "Dilan L.",
    "Anthony M.",
    "Tyler M.",
    "Annie M.",
    "Avery M.",
    "Emily M.",
    "Addison M.",
    "Dylan M.",
    "Owen O.",
    "Zachary P.",
    "Gabriella P.",
    "William P.",
    "Caitlin P.",
    "Syed R.",
    "William R.",
    "Lauren S.",
    "George S.",
    "Astrid S.",
    "Thomas S.",
    "Hailey S.",
    "Jasmine T.",
    "Michael V.",
    "Jonathan W.",
    "Theodore W.",
    "Andrew Y."
]

// Q2

print("SWIFT STUDENTS:")
swiftStudents.forEach { print($0) }

// Q3

func wuTangProgrammer() -> String {
    let firstNames = [ "Coder", "Terminal", "Infinite", "Undefined", "Class", "Root", "Aggregate", "Batch" ]
    let lastNames = [ "Loop", "Breakpoint", "Compiler", "$tack", "Instance", "Function", "Access", "Archive" ]
    
    let coderName = firstNames.randomElement()! + " " + lastNames.randomElement()!
    
    return coderName
}

print(wuTangProgrammer())

// Q4

struct Coder {
    let name: String
    let coderName = wuTangProgrammer()
}

// Q5

var coders = [Coder]()

// Q6

func generateNames(names: [String]) -> [Coder] {
    var outputList = [Coder]()
    
    for name in names {
        outputList.append(Coder(name: name))
    }
    
    return outputList
}

let coderNames = generateNames(names: swiftStudents)

for coder in coderNames {
    print("\(coder.name) is \(coder.coderName)")
}




