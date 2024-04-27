import SwiftUI

struct SelectionView: View {
    
    @ObservedObject var listeTri: ListeTrier
    
    @ObservedObject var listeUser: User
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView(content: {
            
            ZStack {
                Text("Aucun film dans la Sélection")
                                    .opacity( listeTri.listeFilm.isEmpty ? 0.8 : 0)
                ScrollView(showsIndicators: true)  {
                    VStack {
                        
                        LazyVGrid(columns: columns) {
                            ForEach(0..<listeTri.listeFilm.count, id: \.self) { i in
                                
                                NavigationLink(
                                    destination: BoiteDialogue(listeTri: listeTri,
                                                               listeUser: listeUser,
                                                               film: listeTri.listeFilm[i].film,
                                                               ajout: listeTri.listeFilm[i].ajout),
                                    label: {
                                        FilmSubView(film: listeTri.listeFilm[i].film)
                                    })
                                
                            }
                        }
                        
                        Spacer()
                        
                    }.padding(.horizontal)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        
                        // Titre de la page
                        ToolbarItem(placement: .principal) {
                            Text("Sélection").bold().font(.title)
                        }
                        
                        // Bouton qui renvoit à la page pour changer l'ordre de tri
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(
                                destination: TrierView(listeTri: listeTrier),
                                label: {
                                    Text("Trier")
                                })
                        }
                    }
                }
            }
        }).onAppear() {
            listeTri.refresh()
        }
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView(listeTri: listeTrier, listeUser: user)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 11")
        
    }
}

struct FilmSubView: View {
    
    let film: Film
    
    var body: some View {
        
        // Affiche le poster du film avec le titre en blanc sur un fond noir
        VStack{
            
            // Affiche le poster du film
            Image(film.poster)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            // Affiche le titre du film
            Text(film.nom)
                .foregroundColor(.white)
                .padding(.horizontal)
            Spacer()
        }
        .background(Color(red: 0.16, green: 0.16, blue: 0.16))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 20)
        .padding(.top)
        
    }
}

struct BoiteDialogue: View {
    
    @State private var boitedialogue = false
    
    @ObservedObject var listeTri: ListeTrier
    
    @ObservedObject var listeUser: User
    
    @Environment(\.presentationMode) var presentationMode
    
    let film: Film, ajout: Int
    
    var body: some View {
        
        FilmInfoView(film: film)
            
            // Affiche une boite de dialogue pour confirmer de la suppression du film
            .alert(isPresented: $boitedialogue, content: {
                Alert(title: Text("Confirmer la suppression de \(film.nom) ?"),
                      primaryButton: .default(Text("Oui"), action: {
                        
                        // Appel la fonction pour retirer le film en fonction de son ordre d'ajout
                        self.listeTri.removeFilm(ajout: ajout)
                        
                        // Tri les films en fonctions des choix de l'utilisateur
                        self.listeTri.trier(catégorie: listeTri.categorieActive,
                                            triCroissant: listeTri.categorieTriCroissant)
                        
                        // Retour automatique sur l'écran de Sélection
                        self.presentationMode.wrappedValue.dismiss()
                        
                      }),
                      secondaryButton: .cancel(Text("Non")))
            })
            .toolbar {
                
                // Ajoute un bouton pour retirer le film de la sélection
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    // Affiche la boite de dialogue
                    Button("Supprimer le Film") {
                        boitedialogue = true
                    }
                }
            }
        
    }
}
