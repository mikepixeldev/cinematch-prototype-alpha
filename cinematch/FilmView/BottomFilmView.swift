//
//  BottomFilmView.swift
//  cinematch
//
//  Created by Tony Dang on 25/06/2021.
//

import SwiftUI

struct BottomFilmView: View {
    var body: some View {
        HStack{
            Button(action: {


            }, label: {
                Image("dismiss")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
                    .frame(width: 100, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 1)
            })
            Button(action: {


            }, label: {
                Image("refresh")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.yellow)
                    .frame(width: 100, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 1)
            })
            Button(action: {


            }, label: {
                Image("like")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.green)
                    .frame(width: 100, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 1)
            })
        }
    }
}


struct BottomFilmView_Previews: PreviewProvider {
    static var previews: some View {
        BottomFilmView()
    }
}
