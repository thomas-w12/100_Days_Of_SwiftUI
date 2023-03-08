//

import SwiftUI

struct ContentView: View {
    let maxAskedQuestions = 8
    
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var scoreTitle = ""
    @State private var rotate = false
    @State private var fadeToOpacity = 1.0
    
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    @State var userSelection: Int = 0
    @State var userScore: Int = 0
    @State var questionsAsked: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                
                VStack(spacing: 30) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.title)
                            .shadow(radius: 4)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.heavy))
                            .fontWeight(.black)
                            .shadow(radius: 15)
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            if number == correctAnswer {
                                scoreTitle = "Correct!"
                                userScore += 1
                            } else {
                                scoreTitle = "Wrong!"
                            }
                            questionsAsked += 1
                            showingFinalScore = questionsAsked == maxAskedQuestions ? true : false
                            userSelection = number
                            rotate.toggle()
                            fadeToOpacity = 0.25
                            showingScore = !showingFinalScore
                        } label: {

                            
                            FlagImage(imageName: countries[number])
                                .rotation3DEffect(rotate ? Angle(degrees: 0) : Angle(degrees: 360), axis: (x: 0, y: 1, z: 0))
                                .animation(userSelection == number ? .interactiveSpring().speed(0.4) : nil, value: rotate)
                                .opacity(userSelection == number ? 1.0 : fadeToOpacity)
                                .animation(.easeInOut, value: fadeToOpacity)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                
                Text("Score: \(userScore) / \(questionsAsked)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore ) {
            Button("OK") {
                countries.shuffle()
                correctAnswer = Int.random(in: 0...2)
                fadeToOpacity = 1.0
            }
        } message: {
            if (userSelection != correctAnswer) {
                Text("That's the flag of \(countries[userSelection]).")
            }
            
        }
        .alert("Game over", isPresented: $showingFinalScore) {
            Button("Restart Game") {
                reset()
            }
        } message: {
            Text("Your final score is \(userScore) / \(questionsAsked)")
        }
        
        
    }
    
    func reset() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        userScore = 0
        questionsAsked = 0
        fadeToOpacity = 1.0
    }
}

struct FlagImage: View {
    private var imageName: String?
    private var image: Image
    var body: some View {
        image
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(radius: 5)
    }
    
    // Initialize Image from String
    init(imageName: String) {
        self.imageName = imageName
        self.image = Image(imageName)
    }
    
    // Initialize Image from Image (not required for this project, just for learning purposes
    init (image: Image) {
        self.image = image
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
