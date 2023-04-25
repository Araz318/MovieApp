//
//  HomeHelper.swift
//  MovieApp
//
//  Created by Araz Muradov on 20.04.23.
//

import Foundation
enum HomeCategory:String {
    case popular = "Popular"
    case topRated = "Top Rated"
    case upcoming = "Upcoming"
    case nowPlaying = "Now Playing"
}
enum HomeEndpoint: String {
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    case nowPlaying = "movie/now_playing"
    
    var path:String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}


