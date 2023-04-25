//
//  PersonManager.swift
//  MovieApp
//
//  Created by Araz Muradov on 22.04.23.
//

import Foundation

class PersonManager {
    static var shared = PersonManager()
    
    func getMovieItems(category:PersonCategory , completion: @escaping((Person?, String?)->())){
        var url = ""
        switch category {
        case .popular:
            url = PersonEndpoint.popular.path
        }
        NetworkManager.shared.request(model: Person.self, url: url, complete: completion)
        
        
    }
    
    func getPopularPeopleMovieList(id: Int, completion: @escaping ((Cast?, String?) -> ())) {
        _ = "https://api.themoviedb.org/3/person/58021/movie_credits"
        
       
       
        NetworkManager.shared.request(model: Cast.self, url: NetworkHelper.shared.urlConfig(path: "person/\(id)/movie_credits"), complete: completion)

    }
        
        
    }




//url:  NetworkHelper.shared.requestUrl(url: "person/\(id)/movie_credits")
