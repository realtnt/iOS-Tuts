//: [⇐ Previous: 05 - Structures](@previous)
//: ## Episode 06: Challenge - Structures

/*:
 # Challenge 1

1. Create a structure named `Student` with three properties: first name, last name and grade.
2. Create a structure named `Classroom` with two properties: the subject, and an array of students.
3. Create a method that returns the highest grade in the classroom.
*/
struct Student {
    let firstName: String
    let lastName: String
    var grade: Int
}

struct Classroom {
    let subject: String
    var students: [Student]
    func getHighestGrade() -> Int {
        var highestGrade = 0
        for student in students {
            if student.grade > highestGrade {
                highestGrade = student.grade
            }
        }
        return highestGrade
    }
}

let a = Student(firstName: "a", lastName: "al", grade: 10)
let b = Student(firstName: "b", lastName: "bl", grade: 20)
let c = Student(firstName: "c", lastName: "cl", grade: 30)
let d = Student(firstName: "d", lastName: "dl", grade: 40)

let classroom = Classroom(subject: "asdf", students: [a, b, c, d])

print(classroom.getHighestGrade())

/*:
 # Challenge 2

 1. Create an instance of a `Classroom`
 2. Use the `getHighestGrade` method
*/



//: [⇒ Next: 07 - Classes](@next)

