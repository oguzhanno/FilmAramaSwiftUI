//
//  FavoriView.swift
//  FilmAramaSwiftUI
//
//  Created by Oğuzhan on 16.10.2023.
//

import SwiftUI
import Firebase

struct FavoriViewPage: View {
    @ObservedObject var viewModel = FavorilerDao()
  
    func silFavoriFilm (at offsets:IndexSet){
        let  favoriFilm = viewModel.favorilerListesi[offsets.first!]
        viewModel.silFavoriFilm(imdbId: favoriFilm.favoriFilmImdbId)
    }
    
    var body: some View {
        VStack{
            List {
                ForEach(viewModel.favorilerListesi) { favori in
                
                    NavigationLink(
                        destination:DetayView(imdbId:favori.favoriFilmImdbId),
                        label: {
                            
                            Text(favori.favoriFilmTitle)
                                .foregroundColor(.orange)
                                .background(Color.clear)
                                
                        }
                        
                    )
                    .shadow(color: Color.black,radius: 15.0, x: 10, y: 20)
                    
                    
                    
                    
                    
                }
                .onDelete(perform: silFavoriFilm)
            }
            .onAppear(perform: {
                viewModel.filmleriYukle()
                print(viewModel.favorilerListesi)
            }).navigationTitle(Text("Favoriler"))
                
        }
    }
    
}


#Preview {
    FavoriViewPage()
}
