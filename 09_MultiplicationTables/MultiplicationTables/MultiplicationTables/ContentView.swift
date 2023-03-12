//


import SwiftUI

struct ContentView: View {
    
    @State private var multiplicationTable = 5
    @State private var pickerValue = 1
    private var numberOfQuestions: Int {
        pickerValue*5+5
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Stepper(String(multiplicationTable), value: $multiplicationTable, in: 2...12)
                } header: {
                    Text("Multiplicaton table")
                }      footer: {
                    Text("Select the multiplication table you want to practice.")
                }
                
                Section {
                    Picker(selection: $pickerValue) {
                        ForEach(0..<4) { number in
                            Text(String(number*5+5))
                        }
                    } label: {
                        Text("Number of questions asked")
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("number of questions")
                } footer: {
                    Text("Select how many questions you want to be asked.")
                }
            }
            .navigationTitle("Multiplication Tables")
            .scrollDisabled(true)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink {
                        GameView(multiplicationTable: multiplicationTable, numberOfQuestions: numberOfQuestions)
                    } label: {
                        Text("Start game")
                        
                    }
                    .buttonStyle(.borderedProminent)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
