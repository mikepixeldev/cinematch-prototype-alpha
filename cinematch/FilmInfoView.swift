//
//  FilmInfoView.swift
//  cinematch
//
//  Created by Mike on 22/06/2021.
//

import SwiftUI
import AVKit

struct FilmInfoView: View {
    
    let film:Film
    
    var body: some View {
        
        //        NavigationView {
        
        ScrollView(.vertical) {
            
            VStack {
                
                HStack {
                    Spacer()
                    Image(film.poster)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .padding(.bottom, -15.0)
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("\(Image(systemName: "calendar.circle")) \(String(film.dateSortie)) \("• ")\(Image(systemName: "clock")) \(film.duree) min")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding(.top, 5.0)
                            .padding(.bottom, -1.0)
                        Spacer()
                        
                    }
                    
                    Divider().background(Color.white)
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("\(Image(systemName: "star.circle.fill")) \(film.note) % \("•") \(Image(systemName: "person.2.fill")) -\(film.ageMinimum)ans")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding(.top, -1.0)
                            .padding(.bottom, 5.0)
                        
                        Spacer()
                        
                    }
                    
                }
                
                .background(Color.red
                                .opacity(0.8))
                .cornerRadius(15.0)
                .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                .padding()
                
                VStack(alignment: .leading) {
                    
                    Text(film.nom)
                        .font(.title)
                        .fontWeight(.black)
                    
                    Text(film.studio)
                        .font(.headline)
                        .fontWeight(.bold)
                    HStack {
                        
                        Text(film.genre2)
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding(8.0)
                            .background(Color.blue
                                            .opacity(0.8))
                            .cornerRadius(15.0)

                            .padding(-3.0)
                        Spacer()
                        
                    }
                    Text("")
                    
                    Text(film.synopsis)
                        .font(.body)
                        .fontWeight(.light)
                    
                }
                .padding()
                
                Divider()
                
                VStack {
                    
                    Text("Bandes-annonces")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            
                            VideoView(videoURL: URL(string: film.videoTrailer)!, previewLength: 60)
                                .cornerRadius(15)
                                .frame(width: 267, height: 200, alignment: .center)
                            
                            Image("\(film.trailer)")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .cornerRadius(15)
                            
                            Image("\(film.trailer2)")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .cornerRadius(15)
                            
                            //                            Image("\(film.trailer3)")
                            //                                .resizable()
                            //                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            //                                .cornerRadius(15)
                            //                            Image("\(film.trailer4)")
                            //                                .resizable()
                            //                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            //                                .cornerRadius(15)
                            
                            
                        }
                        .padding()
                        .frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    
                }
                .padding(.horizontal, -32.0)
                .padding()
                
                
                Divider()
                
                VStack {
                    
                    Text("Où regarder ?")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    VStack {
                        Text("À la maison")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                        
                        HStack {
                            
                            Image("\(film.plateformesDisplay)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            
                            Image("\(film.plateformesDisplay2)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            
                            
                            //                            Image("Prime")
                            //                                .resizable()
                            //                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            //
                            //                            Image("Disney")
                            //                                .resizable()
                            //                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            
                        }
                        
                        .padding()
                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    
                }
                .padding()
                
                Divider()
                    .frame(width: 150)
                
                VStack(alignment: .leading) {
                    
                    Text("Prochaine Séances cinéma")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        
                        Text(film.seance1)
                        HStack {
                            Link("\(Image(systemName: "ticket")) Réserver", destination: URL(string: "https://www.cinemaspathegaumont.com")!)
                                .foregroundColor(.white)
                                .font(.headline)
                            Spacer()
                        }
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(45.0)
                        .frame(width: 150, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text(film.seance2)
                        HStack {
                            Link("\(Image(systemName: "ticket")) Réserver", destination: URL(string: "https://www.cinemaspathegaumont.com")!)
                                .foregroundColor(.white)
                                .font(.headline)
                            Spacer()
                        }
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(45.0)
                        .frame(width: 150, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    }
                    
                }
                .padding()
                
            }
            .padding()
            
        }
        .navigationBarTitle("Infos", displayMode: .inline)
        //        }
    }
}

struct FilmInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmInfoView(film: avengersEndgame)
            .previewDevice("iPhone 12 Pro")
    }
}
