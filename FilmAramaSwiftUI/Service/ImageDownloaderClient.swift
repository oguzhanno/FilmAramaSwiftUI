//
//  ImageDownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Oğuzhan on 12.10.2023.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    
    @Published var indirilenGorsel : Data?
    
    func gorselIndir(url: String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
        
            DispatchQueue.main.async {
                self.indirilenGorsel = data
            }
            
        }.resume()
        
    }
    
    
    
    
}
