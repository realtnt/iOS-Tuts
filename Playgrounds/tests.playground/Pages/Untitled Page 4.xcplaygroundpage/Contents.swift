//: [Previous](@previous)

import Foundation

// TODO: define the 'LogLevel' enum, its `init`, and its `shortFormat` method
enum LogLevel: String {
    case trace = "TRC"
    case debug = "DBG"
    case info = "INF"
    case warning = "WRN"
    case error = "ERR"
    case fatal = "FTL"
    case unknown

    init(_ logLine: String) {
        let logLevelString = logLine.getSubString(between: "[", and: "]")
        self = LogLevel(rawValue: logLevelString) ?? .unknown
    }
    
    func shortFormat(message: String) -> String {
        var errorCode: Int
        switch self {
        case .trace:
            errorCode = 0
        case . debug:
            errorCode = 1
        case .info:
            errorCode = 4
        case .warning:
            errorCode = 5
        case .error:
            errorCode = 6
        case .fatal:
            errorCode = 7
        default:
            errorCode = 42
        }
        return "\(errorCode): \(message)"
    }
}

extension String {
    func getSubString(between: Character, and: Character) -> String {
        let firstIndex = self.index(after: self.firstIndex(of:"[") ?? self.startIndex)
        let secondIndex = self.firstIndex(of:"]") ?? self.endIndex
        let substring = String(self[firstIndex..<secondIndex])
        return substring
    }
}

print(LogLevel("[INF]: File deleted"))

let overflow = LogLevel.error
overflow.shortFormat(message: "Stack overflow")

//: [Next](@next)
