//


import SwiftUI


struct ContentView: View {
   
    @StateObject var expenses = Expenses()
        
    var body: some View {
      
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete { indexSet in
                    expenses.items.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    expenses.items.append(ExpenseItem(name: "test", type: "misc", amount: 500.06))
                } label: {
                    Label("Add sample expense", systemImage: "cart")
                }
                
                EditButton()
            }
        }
        
       
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
