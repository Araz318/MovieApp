//
//  FavoriteViewModel.swift
//  MovieApp
//
//  Created by Araz Muradov on 15.04.23.
//

import Foundation
class FavoriteViewModel {
    let apiKey = "e2253416fac0cd2476291eb33c92beb7"
    func getFavoriteMovies() {
        NetworkManager.shared.request(model: String.self,
                                      url: NetworkHelper.shared.urlConfig(path: "asdas")) { data, error in
            
        }
    }
}
