import Foundation

//struct TestCase {
//    var url: URL
//    var deepLinkUrl: URL
//    let host = "dq108.playnow.com"
//    let bundleId = "com.sgd.bclc"
//
//    init(urlLink: String) {
//        let urlHost = "https://" + host + "/"
//        let deepUrlHost = bundleId + "://" + host + "/"
//        self.url = URL(string: "\(urlHost)\(urlLink)")!
//        self.deepLinkUrl = URL(string: "\(deepUrlHost)\(urlLink)")!
//    }
//}
//
//
//let randomTest = TestCase(urlLink: "random/test")
//
//print(randomTest.url)
//print(randomTest.deepLinkUrl)

func printHostAndPath(urlLinks: [String]) {
    for urlLink in urlLinks {
        if let url = URL(string: urlLink) {
            print("The link is: |\(urlLink)|")
            print(url.host ?? "No Host")
            print(url.path)
            print("------------------------------------------------")
        } else {
            print("The link is: |\(urlLink)|")
            print("ERROR!")
            print("------------------------------------------------")
        }
    }
}

let links: [String] = [ "account/statement/gaming-limits",
                        "create-account",
                        "p/bonus-policy",
                        "login/knowledge_base",
                        "",
                        "sports/native-bet-manager?sel1=123&stk1=10.0",
                        "environment/games/something",
                        "https://www.prawnhub.com/games/something"
]

printHostAndPath(urlLinks: links)
