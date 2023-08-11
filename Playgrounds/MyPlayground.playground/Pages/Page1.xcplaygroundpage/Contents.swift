import Foundation


func registrationFee(msrp: Int, yearsOld: Int) -> Int {
    guard yearsOld < 10 else { return 25 }

    let base = max(25_000, msrp)
    let depreciationFactor = (100 - Double(yearsOld) * 10) / 100
    
    return Int(Double(base) * depreciationFactor / 100)
}


registrationFee(msrp: 2_250_800, yearsOld: 9)
