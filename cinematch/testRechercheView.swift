//
//  testRechercheView.swift
//  cinematch
//
//  Created by Gregory Dziedzic on 24/06/2021.
//

import SwiftUI

struct testRechercheView: View {
    @ObservedObject var user : User
    var body: some View {
        VStack{
            //            Text(user.plateformes[1].plateforme.description)
            //            if user.plateformes[1].isOn
            //            {
            //                Text("")
            //            }
            //            Toggle(isOn: $user.plateformes[1].isOn, label: {
            //                Text(user.plateformes[1].plateforme.description)
            //            })
            //
            //            ForEach (0...baseDeFilms.listeDesFilms.count-1, id:\.self)
            //            {i in
            //
            //                Text(baseDeFilms.listeDesFilms[i].nom)
            //            }
            //            Divider()
            Text("Résultats recherche:")
                .font(.title)
            ForEach (0...baseDeFilms.recherche(critere: exempleCriteres).0.count-1, id:\.self)
            {j in

                Text(baseDeFilms.recherche(critere: exempleCriteres).0[j].nom)

            }
        }
    }
}

struct testRechercheView_Previews: PreviewProvider {
    static var previews: some View {
        testRechercheView(user: user)
    }
}
