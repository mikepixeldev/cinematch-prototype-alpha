//
//  utilisateur.swift
//  cinematch
//
//  Created by Gregory Dziedzic on 22/06/2021.
//

import Foundation
import MapKit

class User : ObservableObject {
    internal init(name: String = "Roger Dupont", image: String = "rogerdupont", location:Bool=true, gps: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 43.60442520568097, longitude: 1.4433818933047098), distanceCinema:Double=10.0, plateformes: [FiltrePlateforme] = [FiltrePlateforme(plateforme: .netflix, isOn: true),FiltrePlateforme(plateforme: .ocs, isOn: true),FiltrePlateforme(plateforme: .primeVideo, isOn: false),FiltrePlateforme(plateforme: .appleTV, isOn: true),FiltrePlateforme(plateforme: .disneyplus, isOn: false), FiltrePlateforme(plateforme: .canal, isOn: true)], liste: [Film] = []) {
        self.name = name
        self.image = image
        self.location = location
        self.gps = gps
        self.distanceCinema = distanceCinema
        self.plateformes = plateformes
        self.liste = liste
    }

//    class User : ObservableObject {
//        internal init(name: String = "Roger Dupont", image: String = "rogerdupont", gps: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 43.60442520568097, longitude: 1.4433818933047098), plateformes: [PlateformesDispo:Bool] = [.appleTV:false,.disneyplus:false,.primeVideo:false,.ocs:false], liste: [Film] = [hitch, intouchables, gladiator]) {
//            self.name = name
//            self.image = image
//            self.gps = gps
//            self.plateformes = plateformes
//            self.liste = liste
//        }
        
    
    @Published var name:String
    @Published var image:String
    @Published var location:Bool
    @Published var gps:CLLocationCoordinate2D
    @Published var distanceCinema:Double
    @Published var plateformes:[FiltrePlateforme]
    @Published var liste : [Film]
}

var user = User()

//let user=User(name: "Roger Dupont", image: "rogerdupont", gps: CLLocationCoordinate2D(latitude: 43.60442520568097, longitude: 1.4433818933047098), plateformes: [.appleTV,.disneyplus,.primeVideo,.ocs], liste: [hitch, intouchables, gladiator])
