//
//  criteresView.swift
//  cinematch
//
//  Created by Gregory Dziedzic on 22/06/2021.
//

import SwiftUI

struct CriteresView: View {
    @ObservedObject var mesCriteres : Criteres
    var body: some View {
            ScrollView{
                
                //conteneur général
                VStack (alignment: .leading) {
                    // conteneur de la section Ou est ma séance
                    VStack(alignment: .leading) {
                        Text ("Où est ma séance?")
                            .fontWeight(.heavy)
                        Toggle("A la maison", isOn: $mesCriteres.aLaMaison)
                        
                        Toggle("Au cinéma", isOn: $mesCriteres.auCinema)
                        
                        //                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        //                        Text ("Au cinéma")
                        //                    }
                    }
                    .padding(.bottom)
                    Divider()
                    // conteneur de la section Genre
                    VStack(alignment: .leading) {
                        Text ("Genre")
                            .fontWeight(.heavy)
                        ForEach (0...mesCriteres.filtreGenre.count-1, id:\.self)
                        { index in
                            Toggle(isOn: $mesCriteres.filtreGenre[index].isOn) {
                                Text (mesCriteres.filtreGenre[index].genre.description)
                            }
                        }
                    }
                    .padding(.bottom)
                    Divider()
                    
                    // conteneur de la section Réalisateur
                    VStack(alignment: .leading) {
                        Text ("Réalisateur")
                            .fontWeight(.heavy)
                        TextField("Quentin Tarantino", text: $mesCriteres.realisateur)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                    }
                    .padding(.bottom)
                    
                    // conteneur de la section Acteur
                    VStack(alignment: .leading) {
                        Text ("Acteur")
                            .fontWeight(.heavy)
                        TextField("Nathalie Portman", text: $mesCriteres.acteur)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                    }
                    .padding(.bottom)
                    Divider()
                    
                    // conteneur de la date de sortie
                    VStack(alignment: .leading) {
                        Text ("Date de sortie")
                            .fontWeight(.heavy)
                        VStack {
                            HStack{
                                Text ("Entre...")
                                    .fontWeight(.heavy)
                                Stepper(value: $mesCriteres.dateSortieMin) {
                                    Text(String(mesCriteres.dateSortieMin))
                                }
                            }
                                HStack{
                                    Text ("Et...")
                                        .fontWeight(.heavy)
                                    Stepper(value: $mesCriteres.dateSortieMax) {
                                        Text(String(mesCriteres.dateSortieMax))
                                    }
                                

                            }
                        }
                        
                    }
                    .padding(.bottom)
//                    NavigationLink(
//                        destination:
//                            ResultatsView(mesCriteres: mesCriteres)
//
//                        ,
//                        label: {
//                            Text("Résultats de la recherche")
//                                .padding()
//                        })
                    
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
            }
            .navigationTitle("Mes critères")
            .navigationBarTitleDisplayMode(.automatic)
        }
}

struct CriteresView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CriteresView(mesCriteres: Criteres())
        }
    }
}
