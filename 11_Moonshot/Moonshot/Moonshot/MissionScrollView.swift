//


import SwiftUI

struct MissionScrollView: View {
    
    let crew: [CrewMember]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack() {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder(.white, lineWidth: 1)
                                }
                        }
                        
                        VStack(alignment: .leading) {
                            Text(crewMember.astronaut.name)
                                .foregroundColor(.white)
                                .font(.headline)
                                .underline()
                            Text(crewMember.role)
                                .foregroundColor(.secondary)
                        }
                        .padding(.trailing)
                        
                    }
                }
            }
            .padding(.horizontal)
    }
}

struct MissionScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MissionScrollView()
    }
}
