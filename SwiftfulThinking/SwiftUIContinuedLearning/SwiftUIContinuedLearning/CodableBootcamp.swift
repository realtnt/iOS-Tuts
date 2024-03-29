//
//  CodableBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Theo Ntogiakos on 09/03/2023.
//

import SwiftUI

struct CustomerModel: Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
//
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
}

class CodableViewModel: ObservableObject {
    @Published var customer: CustomerModel? = nil // CustomerModel(id: "1", name: "Theo", points: 10, isPremium: true)
    
    init() {
        getDataManual()
    }

    func getData() {
        guard let data = getJSONData() else { return }
        do {
            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
        } catch {
            print("Error decoding. \(error)")
        }
    }

    func getDataManual() {
        guard let data = getJSONData() else { return }


        if let localData = try? JSONSerialization.jsonObject(with: data),
           let dictionary = localData as? [String: Any],
           let id = dictionary["id"] as? String,
           let name = dictionary["name"] as? String,
           let points = dictionary["points"] as? Int,
           let isPremium = dictionary["isPremium"] as? Bool {

            print(data)
            
            let jsonString = String(data: data, encoding: .utf8)
            
            print(jsonString!)
            
            print(localData)
            
            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
            customer = newCustomer
        }
    }
    
    func getJSONData() -> Data? {
        let customer = CustomerModel(id: "100", name: "John", points: 4, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
        
//        let dictionary: [String: Any] = [
//            "id": "123",
//            "name": "Theo",
//            "points": 100,
//            "isPremium": true
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary)
        return jsonData
    }
}

struct CodableBootcamp: View {
    @StateObject var viewModel = CodableViewModel()
    var body: some View {
        VStack(spacing: 20) {
            if let customer = viewModel.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

struct CodableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CodableBootcamp()
    }
}
