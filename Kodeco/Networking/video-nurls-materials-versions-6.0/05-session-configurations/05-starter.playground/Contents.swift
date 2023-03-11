import Foundation

let sharedSession = URLSession.shared

sharedSession.configuration.allowsCellularAccess
sharedSession.configuration.allowsCellularAccess = false
sharedSession.configuration.allowsCellularAccess


let myDefaulConfig = URLSessionConfiguration.default
let ephemeralConfig = URLSessionConfiguration.ephemeral
let backgroundConfig = URLSessionConfiguration.background(withIdentifier: "com.learningAbout.URLSession")

myDefaulConfig.allowsCellularAccess = false
myDefaulConfig.allowsCellularAccess

myDefaulConfig.allowsExpensiveNetworkAccess = true
myDefaulConfig.allowsConstrainedNetworkAccess = true

let myDefaultSession = URLSession(configuration: myDefaulConfig)
myDefaultSession.configuration.allowsCellularAccess

let defaultSession = URLSession(configuration: .default)
defaultSession.configuration.allowsCellularAccess

