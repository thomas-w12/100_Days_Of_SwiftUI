//


import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [.pink, .blue, .green, .yellow, .orange, .red]
    @State private var colors2: [Color] = [.pink, .blue, .green, .yellow, .orange, .red, .black, .white]
    @State private var background: Color = .black
    
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    @State private var hasTimeElapsed = false
    
    var body: some View {
        
        ZStack {
            
            background
                .ignoresSafeArea(.all)
            
            
            
            LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
            // .shadow(color: colors.randomElement() ?? .black ,radius: 50)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation {
                                dragAmount = value.translation
                                colors.shuffle()
                                
                            }
                        }
                        .onEnded({ value in
                            withAnimation(.interpolatingSpring(stiffness: 20, damping: 10)) {
                                dragAmount = CGSize(width: 0, height: 0)
                                
                            }
                        })
                )
        }
        .onAppear {
            
        }
        
        
        
        
        
        
        
        
    }
    

    
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
