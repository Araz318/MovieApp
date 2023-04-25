//
//  PersonHelper.swift
//  MovieApp
//
//  Created by Araz Muradov on 22.04.23.
//

import Foundation
enum PersonCategory:String {
    case popular = "Popular Person"
    
}

enum PersonEndpoint: String {
    case popular = "person/popular"
   
    var path:String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
