//


import SwiftUI

struct ListView: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(1)
                            
                            Text(mission.launchDateString)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    }
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct ListView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        ContentView()
        
    }
}
