//

import SwiftUI

struct GameView: View {
    
    var multiplicationTable: Int
    var numberOfQuestions: Int
    @State private var userValue: Int?
    @FocusState private var textFieldIsFocused: Bool
    @State private var userInput: String = ""
    @State private var showInputError = false
    @State private var showScore = false
    private var questions: [Int]
    
    @State private var correctAnswers: Int = 0
    @State private var currentQuestion: Int = 0
    
    var body: some View {
        
        if showScore {
            ScoreView(userScore: (correctAnswers, numberOfQuestions))
        } else {
            
            VStack(alignment: .center) {
                Text("What is \(multiplicationTable) * \(questions[currentQuestion])?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                
                HStack {
                    
                    TextField("Your answer", text: $userInput)
                        .keyboardType(.numberPad)
                        .focused($textFieldIsFocused)
                    
                    
                    
                }
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.primary)
                    
                }
                
                Spacer()
                
                
                
                Button("Next question") {
                    
                    guard let userNumber = Int(userInput) else {
                        showInputError = true
                        userInput = ""
                        return
                    }
                    
                    
                    
                    
                    
                    if multiplicationTable*questions[currentQuestion] == userNumber {
                        correctAnswers += 1
                    }
                    userInput = ""
                    
                    withAnimation {
                        if currentQuestion < numberOfQuestions-1 {
                            currentQuestion += 1
                            
                        } else {
                            showScore = true
                        }
                        
                    }
                    
                    
                    
                }
                .buttonStyle(.borderedProminent)
                
            }
            .padding(50)
            .alert("Input Error", isPresented: $showInputError) {
                Button("OK") {
                    showInputError = false
                }
            } message: {
                Text("You have to provide a whole number!")
            }
            .navigationBarBackButtonHidden(true)
            
            
        }
    }
    
    
    func createRandomArray(size: Int, numberInRange: ClosedRange<Int>) -> [Int] {
        var prev: Int = 0
        var rand: Int = 0
        var returnArray = [Int]()
        for _ in 0..<size {
            repeat {
                rand = Int.random(in: numberInRange)
            } while rand == prev
            returnArray.append(rand)
            prev = rand
        }
        return returnArray
    }
    
    
    init(multiplicationTable: Int, numberOfQuestions: Int, userValue: Int? = nil) {
        self.multiplicationTable = multiplicationTable
        self.numberOfQuestions = numberOfQuestions
        self.questions = [Int]()
        self.questions = createRandomArray(size: numberOfQuestions, numberInRange: 1...12)
        self.textFieldIsFocused = true
        
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(multiplicationTable: 10, numberOfQuestions: 5)
    }
}
