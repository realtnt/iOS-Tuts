//: [Previous](@previous)
import Foundation

struct Clothes {
    let name: String?
}

// This protocol will hold everything the manager class needs their assistant to do
protocol ManagerDelegate: AnyObject {
    func doLaundry(for manager: Manager, laundry: [Clothes]) -> [Clothes]
    func howMuchMoneyDidWeMake() -> Int
    func whatBearIsBest() -> String
}

class Manager {
    // the manager doesn't care what class their assistant is,
    // only that they can do what the manager needs them to do
    weak var assistant: ManagerDelegate?

    var cleanClothes: [Clothes]? = []
    var dirtyClothes: [Clothes]? = []

    func tellBoss(_ message: String) {
        print(message)
    }

    // whenever the manager needs those tasks done, they just have the assistant do it
    func performEndOfDayTasks() {
        let today = Date()
        if today.isMonday,
           let dirtyClothes = self.dirtyClothes {
            cleanClothes = assistant?.doLaundry(for: self, laundry: dirtyClothes)
        } else if today.isFriday {
            if let profit = assistant?.howMuchMoneyDidWeMake() {
                tellBoss("We made \(profit) dollars this week boss!")
            }
        }
    }
}

extension Date {
    var isMonday: Bool {
        let date = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date) == "Monday"
    }

    var isFriday: Bool {
        let date = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date) == "Friday"
    }
}
// The assistant adopts the protocol and this code will not compile
// unless they meet all the requirements of the protocol
class Assistant: ManagerDelegate {
    var ledger = Ledger(moneyIn: 100, moneyOut: 80)
    func doLaundry(for manager: Manager, laundry: [Clothes]) -> [Clothes] {
        var cleanClothes = washClothes(laundry)
        dryClothes(cleanClothes)
        foldClothes(cleanClothes)
        return cleanClothes
    }
    func howMuchMoneyDidWeMake() -> Int {
        return ledger.profit
    }
    func whatBearIsBest() -> String {
        return "There are basically two schools of thought..."
    }

    func washClothes(_ clothes: [Clothes]?) -> [Clothes] {
        if let clothes = clothes {
            print("\(clothes) were washed.")
            return clothes
        }
        return []
    }

    func dryClothes(_ clothes: [Clothes]?) -> [Clothes] {
        if let clothes = clothes {
            print("\(clothes) were washed.")
            return clothes
        }
        return []
    }

    func foldClothes(_ clothes: [Clothes]?) -> [Clothes] {
        if let clothes = clothes {
            print("\(clothes) were washed.")
            return clothes
        }
        return []
    }
}

struct Ledger {
    var moneyIn: Int
    var moneyOut: Int
    lazy var profit: Int = { return moneyIn - moneyOut }()
}

//: [Next](@next)
