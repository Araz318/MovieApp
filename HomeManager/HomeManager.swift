//
//  HomeManager.swift
//  MovieApp
//
//  Created by Araz Muradov on 20.04.23.
//

import Foundation
class HomeManager {
    static let shared = HomeManager()
    
    func getMovieItems(category: HomeCategory, completion: @escaping((Movie?, String?)->())) {
        var url = ""
        switch category {
        case .popular:
            url = HomeEndpoint.popular.path
        case .topRated:
            url = HomeEndpoint.topRated.path
        case .nowPlaying:
            url = HomeEndpoint.nowPlaying.path
        case .upcoming:
            url = HomeEndpoint.upcoming.path
        }
        NetworkManager.shared.request(model: Movie.self,
                                      url: url,
                                      complete: completion)
    }
}
