//
//  HeadingFilmView.swift
//  cinematch
//
//  Created by Tony Dang on 25/06/2021.
//

import SwiftUI

struct HeadingFilmView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
                    Text("FILMS")
                        .font(.title)
                        .bold()
                Spacer()
                    Text("Critères")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding()
        }
    }

struct HeadingFilmView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingFilmView()
    }
}
