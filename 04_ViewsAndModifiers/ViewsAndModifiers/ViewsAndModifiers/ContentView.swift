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
                .modifier(Title(font: .largeTitle))
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
