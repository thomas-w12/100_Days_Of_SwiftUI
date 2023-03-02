//


import SwiftUI


struct ContentView: View {
    
    private func calculateTime(input: Double?, from: Time, to: Time) -> Double? {
        let secondsConvertTable: Dictionary<Time, Double> = [
            .seconds: 1,
            .minutes: 60,
            .hours: 3600,
            .days: 86_400,
            .week: 604_800,
            .month: 2_629_743.83,
            .year: 31_556_926,
        ]
        if let input = input {
            return input*(secondsConvertTable[from]!)/(secondsConvertTable[to]!)
        }
        return nil
    }
    
    private enum Time: String, CaseIterable {
        case seconds = "sec"
        case minutes = "min"
        case hours = "h"
        case days = "d"
        case week = "w"
        case month = "m"
        case year = "y"
    }
    
    @State private var selectedInputTime: Time = .seconds
    @State private var selectedOutputTime: Time = .seconds
    @State private var numericalInput: Double? = nil
    @FocusState private var inputFocus: Bool
    
    var outputString: String {
        let calculatedOutput = calculateTime(input: numericalInput, from: selectedInputTime,to: selectedOutputTime)
        if let calculatedOutput = calculatedOutput {
            return String(format: "%.2f", calculatedOutput)
        }
        return ""
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input your Value", value: $numericalInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputFocus)
                } header: {
                    Text("Your input Value")
                }
                
                Section {
                    Picker("Input unit", selection: $selectedInputTime) {
                        ForEach(Time.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    
                    Picker("Convert to", selection: $selectedOutputTime) {
                        ForEach(Time.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    
                }
                
                Section {
                    
                    HStack {
                        Text("Converted:")
                        Spacer()
                        
                        // Text(outputString)
                        Text("\(outputString) \(selectedOutputTime.rawValue)")
                    }
                    
                }
                
                
                
            }
            .navigationTitle("Time Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputFocus = false
                    }
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

