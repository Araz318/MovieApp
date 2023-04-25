//
//  PersonViewModel.swift
//  MovieApp
//
//  Created by Araz Muradov on 17.04.23.
//

import Foundation
class PersonViewModel {
    var person = [PersonResult]()
       var successCallback: (()->())?
    func getItems() {
        let items: [PersonCategory] = [.popular]
        for item in items {
            getPerson(category: item)
        }
    }

    private func getPerson(category:PersonCategory) {
        PersonManager.shared.getMovieItems(category: category) { personData, error in
               if let error = error {
                   print( error)
               } else if let personData = personData {
                   self.person = personData.results ?? []
                   self.successCallback?()
               }
           }
       }
}
