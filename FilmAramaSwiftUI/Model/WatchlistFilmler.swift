//
//  WatchlistFilmler.swift
//  FilmAramaSwiftUI
//
//  Created by Oğuzhan on 24.10.2023.
//

import Foundation

class WatchlistFilmler : Identifiable {
    var watchlistFilmAdi:String = ""
    var watchlistImdbId:String = "N/A"
    
    init(){
    }

    init(watchlistFilmAdi:String,watchlistImdbId:String){
        self.watchlistFilmAdi = watchlistFilmAdi
        self.watchlistImdbId = watchlistImdbId
    }

}
