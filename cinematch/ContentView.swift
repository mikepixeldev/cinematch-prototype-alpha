//
//  ContentView.swift
//  cinematch
//
//  Created by Gregory Dziedzic on 22/06/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mesCriteres=Criteres()
    var body: some View {
        TabView {
            
            FilmView(utilisateur: user)
                .tabItem {
                    Image(systemName: "film")
                    Text("Films")
                }
            
            SelectionView(listeTri: listeTrier, listeUser: user)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Sélection")
                }
            
            ProfilView(user:user)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profil")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
