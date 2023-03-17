//


import SwiftUI


struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(ExpenseType.allCases, id: \.self) { expenseType in
                    
                    if expenses.items.contains(where: containsExpense(of: expenseType)) {
                        Section {
                            
                            ForEach(expenses.items) { expenseItem in
                                
                                expenseType == expenseItem.type ? ItemView(item: expenseItem) : nil
                                
                            }
                            .onDelete { indexSet in
                                expenses.items.remove(atOffsets: indexSet)
                            }
                            
                        } header: {
                            Text(expenseType.rawValue)
                        }
                    }
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
    
    func containsExpense(of type: ExpenseType) -> ((ExpenseItem) -> Bool) {
        return { expenseItem in
            return expenseItem.type == type
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
