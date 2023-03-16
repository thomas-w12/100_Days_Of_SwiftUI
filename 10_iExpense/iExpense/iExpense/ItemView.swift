//


import SwiftUI

struct ItemView: View {
    
    var item: ExpenseItem
    
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type.rawValue)
            }
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundColor(item.amount > 100 ? .red : item.amount > 10 ? .orange : .green)
        }
        
    }
    
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: ExpenseItem(name: "Test", type: .business, amount: 100))
    }
}
