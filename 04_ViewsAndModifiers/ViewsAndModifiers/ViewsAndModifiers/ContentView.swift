//


import SwiftUI

struct ContentView: View {
    
    @State private var showRedText = false
    
    var body: some View {
        Button {
            print(type(of: self.body))
            showRedText = !showRedText
        } label: {
            Text("Test")
                .prominentTitle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Title: ViewModifier {
    
    var font: Font
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(.primary)
            .fontWeight(.bold)
            .padding()
            .background(.blue)
            .backgroundStyle(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.teal)
            .fontWeight(.bold)
    }
}

extension View {
    func prominentTitle() -> some View {
        self.modifier(ProminentTitle())
    }
}
