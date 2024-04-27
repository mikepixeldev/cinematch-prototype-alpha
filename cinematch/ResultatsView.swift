//
//  ResultatView.swift
//  cinematch
//
//  Created by Gregory Dziedzic on 25/06/2021.
//

import SwiftUI

struct ResultatsView: View {
    @ObservedObject var mesCriteres : Criteres
    @State private var resultat : [Film]=[avengersEndgame]
    
    var body: some View {
        VStack{
            Text("Resultat")
            ForEach (0...resultat.count-1, id:\.self)
            {j in
                
                Text(resultat[j].nom)
                
            }
            
        }
        .onAppear(perform: {             resultat=baseDeFilms.recherche(critere: mesCriteres).0
            print(mesCriteres.auCinema)
        })
        
    }
}

struct ResultatsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultatsView(mesCriteres:exempleCriteres)
    }
}
