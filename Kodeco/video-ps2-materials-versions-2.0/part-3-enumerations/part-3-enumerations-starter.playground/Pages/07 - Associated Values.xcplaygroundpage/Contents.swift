//: [⇐ Previous: 06 - Challenge - Switch Statements](@previous)
//: ## Episode 07: Enumerations with Associated Values

enum TwoDimensionalPoint {
    case origin
    case onXAxis(Double)
    case onYAxis(Double)
    case noZeroCoordinate(x: Double, y: Double)
}

let coordinates = (x: 1.0, y:3.0)
let twoDimensionalPoint: TwoDimensionalPoint

switch coordinates {
case (0, 0):
    twoDimensionalPoint = .origin
case (_, 0):
    twoDimensionalPoint = .onXAxis(coordinates.x)
case (0, _):
    twoDimensionalPoint = .onYAxis(coordinates.y)
default:
    twoDimensionalPoint = .noZeroCoordinate(x: coordinates.x, y: coordinates.y)
}

func getValues(for point: TwoDimensionalPoint) -> (x: Double, y: Double) {
    switch point {
    case .origin:
        return (0, 0)
    case let .onXAxis(x):
        return (x, 0)
    case let .onYAxis(y):
        return (0, y)
    case let .noZeroCoordinate(x: x, y: y):
        return (x: x, y: y)
    }
}


getValues(for: twoDimensionalPoint)
getValues(for: .onYAxis(0.55))
getValues(for: .noZeroCoordinate(x: 0.5, y: 1.3))

//: [⇒ Next: 08 - Conclusion](@next)
