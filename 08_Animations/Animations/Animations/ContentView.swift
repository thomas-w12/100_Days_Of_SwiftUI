//


import SwiftUI

struct ContentView: View {

    @State private var colors: [Color] = [.pink, .blue, .green, .yellow, .orange, .red]
    @State private var colors2: [Color] = [.pink, .blue, .green, .yellow, .orange, .red, .pink, .blue, .green, .yellow, .orange, .red]
    
    @State private var animationAmount = 0.0
    @State private var backgroundColor: Color = .white
    @State private var scaleEffect = 1.0
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: colors2, startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(scaleEffect)
            
            Button("Tap me") {
                withAnimation(.easeOut(duration: 0.7)) {
                    animationAmount += 360
                    
                    
                    
                }
                
                withAnimation(.easeInOut(duration: 0.1).repeatForever()) {
                    scaleEffect = 3.5
                }
                colors2.shuffle()

//                for color in colors {
//                    withAnimation(.easeOut(duration: 0.3)) {
//                        backgroundColor = color
//
//                    }
//                }
                
            }
            .foregroundColor(.primary)
            .padding(50)
            .background(AngularGradient(colors: colors, center: .center))
            .clipShape(Circle())
            .shadow(color: .pink, radius: 20)
            .rotation3DEffect(.degrees(animationAmount), axis: (1, 1, 0))
            
               
            
           
        }
        
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
