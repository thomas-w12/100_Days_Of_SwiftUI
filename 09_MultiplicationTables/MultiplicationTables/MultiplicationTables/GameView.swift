//

// TODO: Alert if input Int parsing fails, end game after no questions are remaining


import SwiftUI

struct GameView: View {
    
    var multiplicationTable: Int
    var numberOfQuestions: Int
    @State private var userValue: Int?
    @FocusState private var textFieldIsFocused: Bool
    @State private var userInput: String = ""
    @State private var showInputError = false
    private var questions: [Int]
    
    @State private var correctAnswers: Int = 0
    @State private var currentQuestion: Int = 0
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text("What is \(multiplicationTable) * \(questions[currentQuestion])?")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            
            HStack {
                
                TextField("Your answer", text: $userInput)
                    .keyboardType(.numberPad)
                    // .focused($textFieldIsFocused)
                    
                
            }
            .padding()
            .overlay {
                Capsule()
                    
                    .stroke(.primary)
                    
            }
            
            Spacer()
            
   
            
            Button("Next question") {
                if let userNumber = Int(userInput)  {
                    if multiplicationTable*questions[currentQuestion] == userNumber {
                        correctAnswers += 1
                    }
                    withAnimation {
                        currentQuestion += 1

                    }
                } else {
                    showInputError = true
                }
                
                
                
                
                userInput = ""
                
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding(50)
        
        
    }
    
        
        
    init(multiplicationTable: Int, numberOfQuestions: Int, userValue: Int? = nil) {
        self.multiplicationTable = multiplicationTable
        self.numberOfQuestions = numberOfQuestions
        self.questions = [Int]()
        for _ in 0..<self.numberOfQuestions {
            questions.append(Int.random(in: 0...12))
        }
        self.textFieldIsFocused = true

    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(multiplicationTable: 10, numberOfQuestions: 5)
    }
}
