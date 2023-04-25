//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Araz Muradov on 15.04.23.
//

import Foundation

    struct Category {
        let title: String
        let items: [MovieResult]
    }
    
    class HomeViewModel {
            var category = [Category]()
            
            var errorCallback: ((String)->())?
            var successCallback: (()->())?
            
            func getItems() {
                let items: [HomeCategory] = [.popular, .topRated, .upcoming, .nowPlaying]
                for item in items {
                    getMovieItems(category: item)
                }
            }
            
            private func getMovieItems(category: HomeCategory) {
                HomeManager.shared.getMovieItems(category: category) { movieData, error in
                    if let error = error {
                        self.errorCallback?(error)
                    } else if let movieData = movieData {
                        self.category.append(Category(title: category.rawValue,
                                                      items: movieData.results ?? []))
                        self.successCallback?()
                    }
                }
            }
    }

