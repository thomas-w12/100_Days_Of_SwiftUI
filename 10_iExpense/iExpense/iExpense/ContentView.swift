//


import SwiftUI


struct ContentView: View {
   
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
        
    var body: some View {
      
        NavigationView {
            List {
                
                Section {
                    ForEach(expenses.items) { item in
                        
                        if item.type == .personal {
                            ItemView(item: item)

                        }
                        
                    }
                        
                    .onDelete { indexSet in
                        expenses.items.remove(atOffsets: indexSet)
                    }
                } header: {
                    Text("Personal")
                }
                
                
                Section {
                    ForEach(expenses.items) { item in
                        
                        if item.type == .business {
                            ItemView(item: item)

                        }
                        
                    }
                        
                    .onDelete { indexSet in
                        expenses.items.remove(atOffsets: indexSet)
                    }
                } header: {
                    Text("Business")
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
