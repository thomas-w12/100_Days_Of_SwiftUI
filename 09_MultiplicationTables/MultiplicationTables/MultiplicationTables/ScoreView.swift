//


import SwiftUI

struct ScoreView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let emojis = ["🤩", "😄", "🙂", "😐", "🙁"]
    
    var userScore: (score: Int, outOf: Int)
    var userScorePercent: Double {
        Double(userScore.score) / Double(userScore.outOf)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Your score:")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Text("\(userScore.score) out of \(userScore.outOf)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(10)
            
            Text(emojis[Int(round((1-userScorePercent)*4))])
                .font(.system(size: 100))
            
            
            Spacer()
            
            Button("Restart Game") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(userScore: (10, 10))
    }
}
