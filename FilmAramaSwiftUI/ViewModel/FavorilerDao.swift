//
//  FilmlerDao.swift
//  FilmAramaSwiftUI
//
//  Created by Oğuzhan on 17.10.2023.
//

import Foundation
import Firebase


class FavorilerDao : ObservableObject{
    
    @Published var favorilerListesi = [FavoriFilmler]()
    let db = Firestore.firestore()
    let refFavoriler = Database.database().reference().child("filmDetayi")
    
    var liste = FavoriFilmler()
    func kaydet(film:FilmViewModel) {
        let yeniFavori = ["favoriFilmTitle":film.title,"favoriFilmImdbId":film.imdbId,"favoriFilmPoster" : film.poster] as [String:String]
        refFavoriler.child(film.imdbId).setValue(yeniFavori)
        
    }
    func filmleriYukle(){ 
        refFavoriler.observe(.value, with: { snapshot in
            var liste = [FavoriFilmler]()
            if let gelenVeri = snapshot.value as? [String:AnyObject]{
                for satir in gelenVeri{
                    if let d = satir.value as? NSDictionary{
                        let favoriFilmTitle = d["favoriFilmTitle"] as? String ?? ""
                        let favoriFilmImdbId = d["favoriFilmImdbId"] as? String ?? ""
                        let favoriFilmDetayi = FavoriFilmler(favoriFilmTitle: favoriFilmTitle, favoriFilmImdbId: favoriFilmImdbId)
                        if !liste.contains(where: {$0.favoriFilmImdbId == favoriFilmDetayi.favoriFilmImdbId}){
                            liste.append(favoriFilmDetayi) }
                    }
                }
                DispatchQueue.main.async{
                    self.favorilerListesi = liste.sorted{ $0.favoriFilmTitle < $1.favoriFilmTitle}
                }
            }
        })
    }
    func silFavoriFilm(imdbId: String) {
        let refFavoriler = Database.database().reference(withPath: "filmDetayi")
        
        refFavoriler.child(imdbId).removeValue { error, _ in
            if let error = error {
                print("Silme hatası: \(error.localizedDescription)")
            } else {
                print("Veri başarıyla silindi.")
            }
        }
    }

    

}
 
