//


import SwiftUI

struct ScoreView: View {
    
    @Environment(\.dismiss) private var dismiss

    var userScore: (score: Int, outOf: Int)
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Your score:")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Text("\(userScore.score) out of \(userScore.outOf)")
            
            Spacer()
            
            Button("Restart Game") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(userScore: (5, 10))
    }
}
