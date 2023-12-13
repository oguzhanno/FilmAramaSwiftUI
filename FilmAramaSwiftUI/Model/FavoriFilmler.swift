//
//  FavoriFilmler.swift
//  FilmAramaSwiftUI
//
//  Created by Oğuzhan on 22.10.2023.
//

import Foundation

class FavoriFilmler : Identifiable {
    var favoriFilmTitle:String = ""
    var favoriFilmImdbId:String = "N/A" 
    
    init(){
    }

    init(favoriFilmTitle:String,favoriFilmImdbId:String){
        self.favoriFilmImdbId = favoriFilmImdbId
        self.favoriFilmTitle = favoriFilmTitle
    }
}
