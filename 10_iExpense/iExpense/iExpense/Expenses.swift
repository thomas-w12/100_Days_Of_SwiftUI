//


import Foundation

class Expenses: ObservableObject {

    @Published var items: [ExpenseItem] {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItmes = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItmes) {
                self.items = decodedItems
                return
            }
        }
        
        self.items = [ExpenseItem]()
        
    }
    
}
