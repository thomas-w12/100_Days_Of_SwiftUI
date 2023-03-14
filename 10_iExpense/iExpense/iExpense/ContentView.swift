//


import SwiftUI


struct ContentView: View {
   
    @State private var numbers = [Int]()
    @State private var currentnumber = 1
    var body: some View {
       
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) { num in
                        Text("Row \(num)")
                    }
                    .onDelete { indexSet in
                        removeRows(at: indexSet)
                    }
                }
                
                Button("add") {
                    numbers.append(currentnumber)
                    currentnumber += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
                    
            }
        }
        
       
    }
    
    func removeRows(at offset: IndexSet) {
        numbers.remove(atOffsets: offset)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
