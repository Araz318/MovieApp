//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Araz Muradov on 30.04.23.
//

import Foundation
class SearchViewModel {
    var item : Search?
    var text = ""
    var search = [SearchResult]()
       var successCallback: (()->())?
    
    
    func getSearch() {
        SearchManager.shared.getSearchItems(text: text ) { searchData, error in
               if let error = error {
                   print( error)
               } else if let searchData = searchData {
                   self.search = searchData.results ?? []
                   self.successCallback?()
               }
           }
       }
   
    func search(text: String) {
        resetDatas()
        self.text = text
        getSearch()
    }
    
    func resetDatas() {
        text = ""
        item = nil
        search.removeAll()
    }
}
