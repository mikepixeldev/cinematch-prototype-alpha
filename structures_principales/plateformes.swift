//
//  plateformes.swift
//  cinematch
//
//  Created by Gregory Dziedzic on 22/06/2021.
//

import Foundation

struct FiltrePlateforme {
    var plateforme:PlateformesDispo
    var isOn:Bool
}

enum PlateformesDispo:CustomStringConvertible {
    case netflix, ocs, primeVideo, appleTV, disneyplus, canal
    var description: String {
        switch self {
        
        case .netflix:
            return "Netflix"
        case .ocs:
            return "OCS"
        case .primeVideo:
            return "Amazon Prime Video"
        case .appleTV:
            return "AppleTV+"
        case .disneyplus:
            return "Disney+"
        case .canal:
            return "Canal+"
        }
    }
    var iconePlateforme: String {
        switch self {
        
        case .netflix:
            return "netflix"
        case .ocs:
            return "ocs"
        case .primeVideo:
            return "amazon"
        case .appleTV:
            return "apple"
        case .disneyplus:
            return "disney"
        case .canal:
            return "canal"
        }
    }

}
