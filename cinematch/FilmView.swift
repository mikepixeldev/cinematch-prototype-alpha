import SwiftUI


// Tableau des films (temporaires) avec leurs descriptions
struct FilmView: View {
//    @ObservedObject var criteres : Criteres
    @State var films: [FilmSwipe] = []
    
    @State private var filmsComplet: [Film] = baseDeFilms.recherche(critere: exempleCriteres).0
    
    @ObservedObject var utilisateur: User
    
    // Fonction
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(films.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(films.count - 1 - id) * 10
    }
    private var maxID: Int {
        return self.films.map { $0.id! }.max() ?? 0
    }
    
    
    
    var body: some View {
        NavigationView(content: {
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        ZStack {
                            ForEach(self.films, id: \.self) { user in
                                if (self.maxID - 3)...self.maxID ~= user.id! {
                                    CardView(user: user, onRemove: { removedUser in
                                        self.films.removeAll { $0.id == removedUser.id }
                                    }, utilisateur: utilisateur, filmsComplet: filmsComplet)
                                    .animation(.spring())
                                    .frame(width: self.getCardWidth(geometry, id: user.id!),
                                           height:650)
                                    .offset(x: 0, y: self.getCardOffset(geometry, id: user.id!))
                                }
                            }
                        }.padding(.top, 25)
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            BottomFilmView()
                            Spacer()
                        }
                    }.padding(.bottom, 10)
                }
            }.padding(.horizontal)
            // au moment de l'affichage, le tableau films reçoit le paquet de cartes correspondant au résultat de la recherche par critères
            .onAppear {    films = baseDeFilms.recherche(critere: exempleCriteres).1
                filmsComplet = baseDeFilms.recherche(critere: exempleCriteres).0
}
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("Films").bold().font(.title)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: CriteresView(mesCriteres: exempleCriteres)
                        ,
                        label: {
                            Text("Critères")
                        })
                    
                }
            }
        })
    }
}


struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(utilisateur: user)
            .preferredColorScheme(.light)
    }
}
