//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by Araz Muradov on 15.04.23.
//

import Foundation
class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseUrl = "https://api.themoviedb.org/3/"
    let apiKey = "e2253416fac0cd2476291eb33c92beb7"
    let imageBaseUrl = "https://image.tmdb.org/t/p/original/"
    
    func urlConfig(path: String) -> String {
        baseUrl + path + "?api_key=\(apiKey)"
    }
    
    
}
