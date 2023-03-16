//


import SwiftUI


struct ContentView: View {
   
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
        
    var body: some View {
      
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundColor(item.amount > 100 ? .red : item.amount > 10 ? .orange : .green)
                    }
                }
                .onDelete { indexSet in
                    expenses.items.remove(atOffsets: indexSet)
                }
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Label("Add sample expense", systemImage: "plus")
                }
                
                EditButton()
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
        
       
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
