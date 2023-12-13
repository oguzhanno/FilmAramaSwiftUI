//
//  FilmlerSatir.swift
//  FilmAramaSwiftUI
//
//  Created by Oğuzhan on 25.10.2023.
//

import Foundation
import SwiftUI

struct FilmlerSatir: View {
    var watchlistFilm = Watchlist()
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(watchlistFilm.watchlistFilmAdi ?? "").font(.system(size: 20)).foregroundColor(.gray)
        }
    }
}
