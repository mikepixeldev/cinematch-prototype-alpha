//
//  genre.swift
//  cinematch
//
//  Created by Gregory Dziedzic on 22/06/2021.
//

import Foundation

struct FiltreGenre {
    var genre:Genre
    var isOn:Bool
}

enum Genre:CustomStringConvertible, CaseIterable {
    case comedie, drame, romance, action, animation, documentaire, historique, peplum, capeetepee, western, aventure, thriller, criminel, fantastique, sciencefiction, horreur, catastrophe, anticipation, fantasy
    var description: String {
        switch self {
        
        case .comedie:
            return "Comédie"
        case .drame:
            return "Drame"
        case .romance:
            return "Romance"
        case .action:
            return "Action"
        case .animation:
            return "Animation"
        case .documentaire:
            return "Documentaire"
        case .historique:
            return "Historique"
        case .peplum:
            return "Peplum"
        case .capeetepee:
            return "Capes et épées"
        case .western:
            return "Western"
        case .aventure:
            return "Aventure"
        case .thriller:
            return "Thriller"
        case .criminel:
            return "Criminel"
        case .fantastique:
            return "Fantastique"
        case .sciencefiction:
            return "Science-fiction"
        case .horreur:
            return "Horreur"
        case .catastrophe:
            return "Catastrophe"
        case .anticipation:
            return "Anticipation"
        case .fantasy:
            return "Fantasy"
        
        }
    }
}
