//
//  selection.swift
//  cinematch
//
//  Created by Rémi Ageron on 24/06/2021.
//

import Foundation


struct FilmTrier {
        
    let film: Film          // Va chercher le film dans la liste utilisateur
    let nom: String         // Prend le nom pour le tri alphabétique
    let date : Int          // Prend la date pour le tri
    let note : Int          // Prend la note pour le tri
    let ajout : Int         // Prend l'ordre d'ajout pour le tri
    
}

class ListeTrier: ObservableObject {
    
    @Published var listeFilm: [FilmTrier]           // Va chercher la liste dans FilmTrier
    @Published var categorieActive: Int             // Renseigne la positions dans le tableau de la catégorie active
    @Published var categorieTriCroissant: Bool      // Renseigne si le tri est croissant ou décroissant
    let categorieNoms: [String]                     // Renseigne les noms des catégories de tri
    
    init() {
        
        self.listeFilm = []
        self.categorieActive = 3
        self.categorieTriCroissant = true
        self.categorieNoms = ["Alphabétique", "Date de Sortie", "Critique", "Ajout"]
    }
    
    func refresh () {
        
        if !listeFilm.isEmpty {
            self.listeFilm = []
        }
        
        for i in (0..<user.liste.count) {
            self.listeFilm.append(FilmTrier(film: user.liste[i], nom: user.liste[i].nom, date: user.liste[i].dateSortie, note: user.liste[i].note, ajout: i))
        }
        
        self.listeFilm.reverse()
        
    }
    
    func changeCategorie (categorieActive: Int) {
        
        self.categorieActive = categorieActive      // Fonction pour changer la catégorie de tri
        
    }
    
    func changeTriCroissant (triCroissant: Bool) {
        
        self.categorieTriCroissant = triCroissant       // Fonction pour changer l'ordre du tri (croissant/décroissant)
        
    }
    
    func trier(catégorie: Int, triCroissant: Bool) {
        
        if catégorie == 0 {
            return self.listeFilm.sort { triCroissant ? $0.nom < $1.nom : $0.nom > $1.nom }             // Range les films par ordre alphabétique
        } else if catégorie == 1 {
            return self.listeFilm.sort { triCroissant ? $1.date < $0.date : $1.date > $0.date }         // Range les films par année de sortie
        } else if catégorie == 2 {
            return self.listeFilm.sort { triCroissant ? $1.note < $0.note : $1.note > $0.note }         // Range les films par note critique
        } else {
            return self.listeFilm.sort { triCroissant ? $1.ajout < $0.ajout : $1.ajout > $0.ajout }     // Range les films par ordre d'ajout
        }
        
    }
    
    func removeFilm(ajout: Int) {
        
        user.liste.remove(at: ajout)
        
        listeFilm.removeAll()
        
        for i in (0..<user.liste.count) {
            listeFilm.append(FilmTrier(film: user.liste[i], nom: user.liste[i].nom, date: user.liste[i].dateSortie, note: user.liste[i].note, ajout: i))
        }
        
    }
}

var listeTrier = ListeTrier()
