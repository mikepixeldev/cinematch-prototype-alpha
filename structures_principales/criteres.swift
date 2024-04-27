//
//  criteres.swift
//  cinematch
//
//  Created by Gregory Dziedzic on 22/06/2021.
//

import Foundation

class Criteres:ObservableObject {
    internal init(aLaMaison: Bool = true, auCinema: Bool = false, realisateur: String = "", acteur: String = "", dateSortieMin: Int = 1980, dateSortieMax: Int = 2022, nouveaute: Bool = false, filtreGenre: [FiltreGenre] = [FiltreGenre(genre:.action, isOn: false), FiltreGenre(genre:.animation, isOn: false),FiltreGenre(genre:.anticipation, isOn:false),FiltreGenre(genre:.aventure, isOn:false),FiltreGenre(genre:.capeetepee, isOn:false),FiltreGenre(genre:.catastrophe, isOn:false),FiltreGenre(genre:.comedie, isOn:false),FiltreGenre(genre:.criminel, isOn:false),FiltreGenre(genre:.documentaire, isOn:false),FiltreGenre(genre:.drame, isOn:false),FiltreGenre(genre:.fantastique, isOn:false),FiltreGenre(genre:.fantasy, isOn:false),FiltreGenre(genre:.historique, isOn:false),FiltreGenre(genre:.horreur, isOn:false),FiltreGenre(genre:.peplum, isOn:false),FiltreGenre(genre:.romance, isOn:false),FiltreGenre(genre:.sciencefiction, isOn:false),FiltreGenre(genre:.thriller, isOn:false),FiltreGenre(genre:.western, isOn:false)]) {
        self.aLaMaison = aLaMaison
        self.auCinema = auCinema
        self.realisateur = realisateur
        self.acteur = acteur
        self.dateSortieMin = dateSortieMin
        self.dateSortieMax = dateSortieMax
        self.nouveaute = nouveaute
        self.filtreGenre = filtreGenre
    }
    
    @Published var aLaMaison:Bool
    @Published var auCinema:Bool
    @Published var realisateur:String
    @Published var acteur:String
    @Published var dateSortieMin:Int
    @Published var dateSortieMax:Int
    @Published var nouveaute:Bool
    @Published var filtreGenre:[FiltreGenre]
}



//struct Criteres {
//    var aLaMaison:Bool
//    var auCinema:Bool
//    var realisateur:String
//    var acteur: String
//    var dateSortieMin: Int
//    var dateSortieMax: Int
//    var nouveaute:Bool
//    var genre:[Genre]
//}
var exempleCriteres = Criteres()
