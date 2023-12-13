import Foundation
import CoreData

class WatchlistDao: ObservableObject {
    @Published var watchlistListesi = [Watchlist]()
    let context = persistentContainer.viewContext
    var liste = Watchlist()
    
    func kaydet(film: FilmViewModel) {
        if !watchlistListesi.contains(where: { $0.watchlistImdbId == film.imdbId }) {
            let watchlist = Watchlist(context: context)
            watchlist.watchlistFilmAdi = film.title
            watchlist.watchlistImdbId = film.imdbId
            saveContext()
            
        }
    }
    
    func watchlistGetir() {
        do {
            let liste = try context.fetch(Watchlist.fetchRequest())
            watchlistListesi = liste
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func sil(watchlistFilm: Watchlist) {
        context.delete(watchlistFilm)
        saveContext()
        watchlistGetir()
    }
}
