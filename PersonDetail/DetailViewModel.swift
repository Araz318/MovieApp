//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Araz Muradov on 23.04.23.
//

import Foundation
class DetailViewModel {
    var id: Int?
    var cast = [CastResult]()
       var successCallback: (()->())?
    
    
    func getDetail() {
        PersonManager.shared.getPopularPeopleMovieList(id: id ?? 0 ) { castData, error in
               if let error = error {
                   print( error)
               } else if let castData = castData {
                   self.cast = castData.cast ?? []
                   self.successCallback?()
               }
           }
       }
}
