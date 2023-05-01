//
//  SearchManager.swift
//  MovieApp
//
//  Created by Araz Muradov on 30.04.23.
//

import Foundation
//protocol SearchManagerProtocol {
//    func getSearchItems(text: String, complete: @escaping((Search?, String?)->()))
//}

class SearchManager {
    static let shared = SearchManager()
    
    func getSearchItems(text: String, complete: @escaping ((Search?, String?) -> ())) {
        NetworkManager.shared.request(model: Search.self,
                                      url: SearchEndpoint.search.path + "&query=\(text)",
                                      complete: complete)
                                     
        }
    }

