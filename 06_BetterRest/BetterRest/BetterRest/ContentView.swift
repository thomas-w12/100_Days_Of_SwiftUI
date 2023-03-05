//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmountBinding = 0
    @State private var showAlert = false
    
    private var coffeeAmount: Int {
        coffeeAmountBinding+1
    }
    
    private var bedtime: String {
        var sleepTime: Date?
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let wakeUpInSeconds = (components.hour ?? 0) * 3600 + (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(wakeUpInSeconds), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            sleepTime = wakeUp-prediction.actualSleep
        } catch {
            print("error")
        }
        return sleepTime?.formatted(date: .omitted, time: .shortened) ?? "error"
        
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Please enter a time:", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                }
                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep:")
                        .font(.headline)
                }
                
                Section {
                    Picker("coffee amount", selection: $coffeeAmountBinding) {
                        ForEach(0..<20) { a in
                            Text("\(a+1)")
                        }
                    }
                } header: {
                    Text("Daily coffee intake:")
                        .font(.headline)
                }
                
                
                Section {
                    
                    
                    VStack {
                        Text("Your ideal bedtime is:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(bedtime)
                            .frame(maxWidth: .infinity,alignment: .center)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(5)
                    }
                    
                    
                }
                
                
                
            }
            .navigationTitle("Better Rest")
            
            
        }
        .scrollDisabled(true)
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
