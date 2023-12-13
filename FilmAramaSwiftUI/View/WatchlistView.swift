//
//  WatchlistView.swift
//  FilmAramaSwiftUI
//
//  Created by Oğuzhan on 16.10.2023.
//

import SwiftUI
import CoreData

struct WatchlistView: View {
    @ObservedObject var watchlistModel = WatchlistDao()
    
    func sil (at offsets:IndexSet){
        let  watchlistFilm = watchlistModel.watchlistListesi[offsets.first!]
        watchlistModel.sil(watchlistFilm: watchlistFilm)
    }
    var body: some View {
        VStack{
            List {
                ForEach(watchlistModel.watchlistListesi) { watchlist in
                    NavigationLink(
                        destination: DetayView(imdbId: watchlist.watchlistImdbId ?? ""),
                        label: {
                            Text(watchlist.watchlistFilmAdi ?? "")
                                .foregroundColor(.orange)
                        }
                    ) .shadow(color: Color.black,radius: 15.0, x: 10, y: 20)
                }
                .onDelete(perform: sil) 
            }
            .onAppear(perform: {
                watchlistModel.watchlistGetir()
                print(watchlistModel.watchlistListesi)
            })
            .navigationTitle(Text("Watchlist"))
        }
    }
    
    
    struct WatchlistView_Previews: PreviewProvider {
        static var previews: some View {
            DetayView(imdbId: "test")
        }
    }
}
