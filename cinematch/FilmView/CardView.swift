//
//  CardView.swift
//  cinematch
//
//  Created by Tony Dang on 25/06/2021.
//
import SwiftUI
import UIKit

struct CardView: View {
    
    @ObservedObject var utilisateur: User
    
    var filmsComplet: [Film]
    
    @State private var statusFilm = false
    
    @State private var translation: CGSize = .zero
    @State private var nope = false
    @State private var like = false
    
    private var moovie: FilmSwipe
    private var onRemove: (_ user: FilmSwipe) -> Void
    
    private var thresholdPercentage: CGFloat = 0.5
    
    init(user: FilmSwipe, onRemove: @escaping (_ user: FilmSwipe) -> Void, utilisateur: User, filmsComplet: [Film]) {
        self.moovie = user
        self.onRemove = onRemove
        self.utilisateur = utilisateur
        self.filmsComplet = filmsComplet
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            NavigationLink(
                destination: FilmInfoView(film:filmsComplet[moovie.id!]),
                label: {
                    ZStack(alignment: .leading) {
                        VStack {
                            Image(self.moovie.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Spacer()
                        }
                        VStack {
                            HStack {
                                Image("yes")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:150)
                                    .opacity(like ? 1 : 0)
                                Spacer()
                                Image("nope")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:150)
                                    .opacity(nope ? 1 : 0)
                            }
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            ZStack {
                                HStack {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("\(self.moovie.filmName)")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(Color.primary.opacity(0.8))
                                        Text(self.moovie.annee)
                                            .font(.subheadline)
                                            .bold()
                                            .foregroundColor(.primary)
                                        Text("Durée : \(self.moovie.duree) min")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                }
                                .padding([.leading, .bottom, .trailing])
                                .padding(.top, 5)
                                .background(Color.white)
                            }
                        }
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                VStack(alignment: .center) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                        .foregroundColor(.green)
                                    Text("Déjà dans votre liste !")
                                        .font(.caption)
                                        .foregroundColor(.primary)
                                }.opacity(statusFilm ? 1 : 0)
                            }
                        }.padding(7)
                        
                    }
                    .background(Color.white)
                    .frame(height: 600)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .offset(x: self.translation.width, y: 0)
                    .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.translation = value.translation
                                if translation.width > 0 {
                                    like = true
                                    nope = false
                                } else {
                                    nope = true
                                    like = false
                                }
                            }.onEnded { value in
                                if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                                    self.onRemove(self.moovie)
                                    if translation.width < 0 {
                                    } else {
                                        if !statusFilm {
                                            self.utilisateur.liste.append(filmsComplet[moovie.id!])
                                        }
                                    }
                                } else {
                                    nope = false
                                    like = false
                                    self.translation = .zero
                                }
                            }
                    )
                    .onAppear() {
                        for i in (0..<utilisateur.liste.count) {
                            if utilisateur.liste[i].id == filmsComplet[moovie.id!].id {
                                self.statusFilm = true
                                break
                            }
                        }
                    }
                })
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(user: FilmSwipe(id: 0, filmName: "Shrek", annee: "2001", duree: "1h30", imageName: "shrek"),
                 onRemove: { _ in
                 }, utilisateur: user, filmsComplet: baseDeFilms.recherche(critere: exempleCriteres).0)
            .frame(height: 700)
            .padding()
    }
}
