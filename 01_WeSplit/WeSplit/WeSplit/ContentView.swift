//


import SwiftUI


struct ContentView: View {
    
    private var currentCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "EUR")
    @State private var checkAmount: Double? = nil
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 10
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var amountPerPerson:Double {
        ((checkAmount ?? 0.0)*(1.0+Double(tipPercentage)/100))/Double(numberOfPeople+2)
    }
    
    var grandTotal: Double {
        (checkAmount ?? 0.0)*(1.0+Double(tipPercentage)/100)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currentCurrency)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(0..<98) {
                            Text("\($0+2) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                   
                    
                }
                
                
                
                Section {
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(00..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                } header: {
                    Text("Tip percentage")
                }
                
                
                
                
                Section {
                    Text(amountPerPerson, format: currentCurrency)
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(grandTotal, format: currentCurrency)
                } header: {
                    Text("Grand total")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                    .foregroundColor(.blue)
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
