//


import Foundation

enum ExpenseType: String, Codable, CaseIterable {
    case personal = "Personal"
    case business = "Business"
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}

