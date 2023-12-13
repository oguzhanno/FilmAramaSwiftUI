//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Oğuzhan on 12.10.2023.
//

import SwiftUI
import Firebase

struct DetayView: View {
    var fdao = FavorilerDao()
    var wdao = WatchlistDao()
    let imdbId : String
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    
    
    @ObservedObject var viewModel = FavorilerDao()
    
    var body: some View {
        NavigationView{
            
            VStack(alignment:.leading, spacing:5){
                HStack{
                    Spacer()
                    OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.4, alignment: .center)
                        .cornerRadius(40)
                        .shadow(color: Color.black,radius: 10.0, x: 15, y: 15)
                    

                    
                    Spacer()
                }
                Text(filmDetayViewModel.filmDetayi?.title ?? "Film Ismi Gösterilecek").font(.title3).foregroundColor(.blue).padding()
                
                Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek").padding()
                
                Text("Yönetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen Gösterilecek")").padding()
                
                Text("Yazar: \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar Gösterilecek")").padding()
                
                Text("Ödüller: \(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller Gösterilecek")").padding()
                
                Text("Yıl: \(filmDetayViewModel.filmDetayi?.year ?? "Yıl Gösterilecek")").padding() 
                
                Spacer()
                
            }
            
            .onAppear(perform: {
                self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
                
                viewModel.filmleriYukle()
                
                
                
            })
        }.toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing){

                     Button{
                            fdao.kaydet(film: FilmViewModel(film: Film(title: filmDetayViewModel.filmDetayi!.title, year: filmDetayViewModel.filmDetayi?.year ?? "", imdbId: filmDetayViewModel.filmDetayi!.imdbId, type: "", poster:  filmDetayViewModel.filmDetayi!.poster)))
                            fdao.filmleriYukle()
                        }
                    label: {
                        Image(systemName: "heart.fill").foregroundColor(Color.red)
                    }
                    Button{
                        wdao.kaydet(film: FilmViewModel(film: Film(title: filmDetayViewModel.filmDetayi?.title ?? "", year: filmDetayViewModel.filmDetayi?.year ?? "", imdbId: filmDetayViewModel.filmDetayi?.imdbId ?? "", type: "", poster: "")))
                    }
                    
                label: {
                    Image(systemName: "eyeglasses").foregroundColor(Color.red)
                }

            }
        }
    
    }
        
        
        
        struct DetayView_Previews: PreviewProvider {
            static var previews: some View {
                DetayView(imdbId: "test")
            }
        }
    }
