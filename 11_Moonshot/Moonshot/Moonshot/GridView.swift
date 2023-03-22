//


import SwiftUI

struct GridView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.launchDateString)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
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

//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView()
//    }
//}
