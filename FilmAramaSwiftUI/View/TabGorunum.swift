//
//  TabView.swift
//  FilmAramaSwiftUI
//
//  Created by Oğuzhan on 16.10.2023.
//

import SwiftUI

struct TabGorunum: View {
    var body: some View {
        NavigationView{
            TabView{
                FilmListeView().tabItem {
                    Label("Arama",systemImage: "plus.magnifyingglass")
                }
                WatchlistView().tabItem {
                    Label("İzleme Listesi",systemImage: "eye")
                }
                FavoriViewPage().tabItem {
                    Label("Favoriler",systemImage: "heart.fill")
                }
            }
        }.background( RadialGradient(gradient: Gradient(colors: [.blue,.black, .white]), center: .center, startRadius: 2, endRadius: 650))
            .ignoresSafeArea().navigationBarBackButtonHidden(true)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabGorunum()
    }
}
