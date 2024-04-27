//
//  baseFilms.swift
//  cinematch
//
//  Created by Gregory Dziedzic on 22/06/2021.
//

import Foundation
struct BaseDeFilms {
    var listeDesFilms:[Film]
    // fonction renvoyant les résultats de la recherche par critère sous forme d'un tuple liste de films / liste de FilmSwipe
    mutating func recherche(critere:Criteres) -> ([Film],[FilmSwipe])
    {
        var listeRecherche:[Film]=[]
        var listeSwipeCards:[FilmSwipe]=[]
        var tempCard = FilmSwipe(id: nil, filmName: "", annee: "", duree: "", imageName: "")
        var indexFilm = 0
        // extraction des films correspondant aux criteres obligatoires simples
        listeRecherche = listeDesFilms.filter { film in return
            (film.dateSortie>=critere.dateSortieMin
                && film.dateSortie<=critere.dateSortieMax
                && (critere.acteur=="" ? true : film.acteur.contains(critere.acteur))
                && (critere.realisateur=="" ? true : film.realisateur.contains(critere.realisateur))
            )
            
        }
        
        // pondération de la valeur concordance critère
        for filmCourant in listeRecherche
        {
            listeRecherche[indexFilm].concordanceCriteres = 0
            for genresFilmCourant in filmCourant.genre
            {
                print("***************************************************")
                print (filmCourant.nom)
                print (filmCourant.genre.description)
                print("***************************************************")
                
                for genreATester in exempleCriteres.filtreGenre {
                    print("Test des valeurs suivantes:")
                    print(genresFilmCourant.description)
                    print(genreATester.genre.description)
                    print("La première valeur contient-elle la seconde?")
                    if genreATester.isOn{
                        if genresFilmCourant.description.contains(genreATester.genre.description)
                        {
                            listeRecherche[indexFilm].concordanceCriteres += 1
                            print("Yes!!!")
                        }
                        else
                        {
                            print("No!!!")
                        }
                    }
                }
                print("Nombre de critères qui matchent:")
                print (listeRecherche[indexFilm].concordanceCriteres)
            }
            print (filmCourant.concordanceCriteres)
            indexFilm += 1
        }
        
        
        // tri de listeRecherche en fonction de la pondération
        listeRecherche.sort {
            $0.concordanceCriteres < $1.concordanceCriteres
        }
        
        
        // Création d'une liste d'enregistrements Swipe Card à partir de la liste de film résultant de la recherche
        for indexFilm in 0...listeRecherche.count-1
        {
            tempCard.id=indexFilm
            tempCard.filmName=listeRecherche[indexFilm].nom
            tempCard.annee=String(listeRecherche[indexFilm].dateSortie)
            tempCard.duree=String(listeRecherche[indexFilm].duree)
            tempCard.imageName=listeRecherche[indexFilm].poster
            listeSwipeCards.append(tempCard)
        }
        return (listeRecherche, listeSwipeCards)
    }
}
var baseDeFilms = BaseDeFilms(listeDesFilms: [avengersEndgame, nosJoursHeureux, underground, hitch, retourverslefutur, intouchables, harrypotter4, gladiator, shrek, thematrix, bigfish, titanic, tenet, lahaut, lemans66, jurassicworld, skyfall, the127h, marchedelempereur, troie, maskdezorro, benhur, budapesthotel, insaisissables, freesolo, thedarkknight, walle, cask, avatar, supersizeme, annabelle, django, bladerunner, cuirassepotemkine, autantenemportelevent, bowlingcolumbine, conan])

struct FilmSwipe: Hashable, CustomStringConvertible{
    var id: Int?
    
    var filmName: String
    var annee: String
    var duree: String
    var imageName: String
    
    var description: String {
        return "\(filmName), id: \(String(describing: id))"
    }
}

struct SwipePacket {
    var listeSwipe:[FilmSwipe]
}
