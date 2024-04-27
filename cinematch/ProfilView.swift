//
//  ProfilView.swift
//  cinematch
//
//  Created by Gregory Dziedzic on 22/06/2021.
//

import SwiftUI

struct ProfilView: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    @ObservedObject var user:User
    var body: some View {
        NavigationView(content: {
            ScrollView{
            VStack{
    //            Text("Profil")
    //                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    //                .bold()
    //            Divider()
                HStack{
                    Text("Roger Dupont")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Image("rogerdupont")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding()
                }
                VStack{
                    HStack{
                        Text("Les cinémas autour de moi")
                            .bold()
                            .font(.title3)
                            .padding()
                        Spacer()
                    }
                    .padding(.horizontal)
//                    Toggle(isOn: $user.location) {Text ("Activer la géolocalisation")
//                    }
//                    .padding(.horizontal)
                    Spacer()
                    Text ("Dans un rayon de \(user.distanceCinema, specifier: "%.0f") km")
                    Slider(value: $user.distanceCinema,
                           in: 0...100,
                           onEditingChanged: { editing in
                            isEditing = editing
                           })
                        .padding(.horizontal)
                    Spacer()
                }
                VStack{
                    HStack{
                        Spacer()
                        Text("Mes plateformes")
                            .fontWeight(.bold)
                            .font(.title2)
                            .padding()
                        Spacer ()
                    }
                    .padding(.horizontal)
                    VStack{
                        Toggle(isOn: $user.plateformes[0].isOn) {Image("Netflix")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.bottom, -1.0)
                        .frame(width: 200)
                        Toggle(isOn: $user.plateformes[1].isOn) {Image("OCS")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.bottom, -1.0)
                        .frame(width: 200)
                        Toggle(isOn: $user.plateformes[2].isOn) {Image("Prime")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.bottom, -1.0)
                        .frame(width: 200)
                        
                        Toggle(isOn: $user.plateformes[3].isOn) {Image("AppleTV")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.bottom, -1.0)
                        .frame(width: 200)
                        Toggle(isOn: $user.plateformes[4].isOn) {Image("Disney")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.bottom, -1.0)
                        .frame(width: 200)
                        
                        Toggle(isOn: $user.plateformes[5].isOn) {Image("Canal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.bottom, -1.0)
                        .frame(width: 200)
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                }
                .background(Color.gray.opacity(0.2))

            }
            .ignoresSafeArea(edges: .bottom)

            //   Spacer()
            // VStack{
            //   Image (systemName: "plus.circle")
            //      .resizable()
            //     .aspectRatio(contentMode: .fit)
            //    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            //  Text("Ajouter une plateforme")
        }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal,
                    content:
                        {
                          Text("Profil")
                            .bold()
                            .font(.title)
                            
                        }
                )
        }
        })
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(user: User())
    }
}
