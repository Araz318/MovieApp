//
//  SearchHelper.swift
//  MovieApp
//
//  Created by Araz Muradov on 30.04.23.
//

import Foundation

enum SearchEndpoint: String {
    case search = "search/movie"
    
    var path: String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
