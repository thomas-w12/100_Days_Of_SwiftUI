//


import SwiftUI

struct ContentView: View {
    
    private let gameOptions = ["Rock", "Paper", "Scissors"]
    private let winOptions = [1,2,0]
    private let looseOptions = [2,0,1]
    //  @State private var appPick: String = "Rock"
    @State private var appPick: Int = Int.random(in: 0...2)

    @State private var prompt: Bool = Bool.random()
    @State private var userCorrect: Bool = false
    @State private var showAlert = false
    @State private var rounds = 0
    @State private var userScore = 0
    @State private var userPick: String = ""
    @State private var showScoreAlert: Bool = false
    
    
    var body: some View {
        
        
        
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.gray , .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .orange]), startPoint: .trailing, endPoint: .leading))
                
               // Text(appPick)
                Text(gameOptions[appPick])
                    .font(.largeTitle)
                    .frame(minWidth: 150)
                    .fontWeight(.bold)
                    .padding(30)
                    .background(LinearGradient(gradient: Gradient(colors: [.teal, .orange]), startPoint: .trailing, endPoint: .leading))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
                
                Spacer()
                
                HStack(spacing: 0) {
                    Text("How to ")
                    Text(prompt ? "win" : "loose")
                        .foregroundColor(prompt ? .green : .red)
                    Text(" this round?")
                }
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
                Spacer()
                
                ForEach(gameOptions, id: \.self) { a in
                    Button {
                        
                        switch a {
                        case gameOptions[0]:
                            //userCorrect = prompt && appPick == gameOptions[2] || !prompt && appPick == gameOptions[1]
                            userCorrect = prompt && appPick == 2 || !prompt && appPick == 1
                        case gameOptions[1]:
                            //userCorrect = prompt && appPick == gameOptions[0] || !prompt && appPick == gameOptions[2]
                            userCorrect = prompt && appPick == 0 || !prompt && appPick == 2
                        case gameOptions[2]:
                            //userCorrect = prompt && appPick == gameOptions[1] || !prompt && appPick == gameOptions[0]
                            userCorrect = prompt && appPick == 1 || !prompt && appPick == 0
                        default:
                            userCorrect = false
                        }
                        userScore = userCorrect ? userScore+1 : userScore
                        userPick = a
                        rounds += 1
                        showScoreAlert = rounds == 10
                        showAlert = !showScoreAlert
                        print("test")
                    } label: {
                        Text(a)
                        
                            .font(.largeTitle)
                            .frame(minWidth: 150)
                            .fontWeight(.bold)
                            .padding(30)
                            .foregroundColor(.white.opacity(0.8))
                            .background(showAlert ? (userPick == a ? (userCorrect ? .green : .red) : .gray.opacity(0.4)) : .gray.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        
                    }
                    .buttonStyle(.plain)
                    
                }
                Spacer()
                
                Text("Score: \(userScore) / \(rounds)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                Spacer()
                
            }
            .alert(userCorrect ? "Correct!" : "Wrong!", isPresented: $showAlert) {
                Button {
                    prompt = Bool.random()
                    appPick = Int.random(in: 0...2)
                    showAlert = false
                } label: {
                    Text("OK ")
                }
                
                
            } message: {
                Text("Test")
                
            }
            .alert("Final Score", isPresented: $showScoreAlert) {
                Button {
                    prompt = Bool.random()
                    appPick = Int.random(in: 0...2)
                    userScore = 0
                    rounds = 0
                    showScoreAlert = false
                } label: {
                    Text("Restart Game")
                }
                
            } message: {
                Text("Test")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
