//


import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
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
                                scoreTitle = "Correct"
                            } else {
                                scoreTitle = "Wrong"
                            }
                            showingScore = true
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                        .alert(scoreTitle, isPresented: $showingScore) {
                            Button("OK") {
                                countries.shuffle()
                                correctAnswer = Int.random(in: 0...2)
                            }
                        } message: {
                            // To Do
                        }
                        
                    }
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()

                Text("Score: To DO")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()

                
            }
            .padding()

            
        }
       
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
