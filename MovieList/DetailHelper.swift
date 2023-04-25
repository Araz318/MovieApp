//
//  DetailHelper.swift
//  MovieApp
//
//  Created by Araz Muradov on 24.04.23.
//

import Foundation
import Foundation
enum DetailCategory:String {
    case popular = "Popular Person"
}

enum DetailEndpoint: String {
    case popular = "person/popular"
    
    var path:String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
