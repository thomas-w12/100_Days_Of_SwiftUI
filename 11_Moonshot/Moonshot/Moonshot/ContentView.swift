//


import SwiftUI


struct ContentView: View {
    
    @State private var showAsGrid: Bool = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                if showAsGrid {
                    GridView(missions: missions, astronauts: astronauts)
                } else {
                    ListView(missions: missions, astronauts: astronauts)
                }
                
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                    Button {
                        showAsGrid.toggle()
                    } label: {
                        
                        showAsGrid ? Image(systemName: "list.dash") : Image(systemName: "square.grid.2x2")
                    }
                
                    
                
            }
            
            
        }
        
        
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
