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
        //    var movie: Movie?
        var category = [Category]()
        
        var successCallback: (()->())?
        
        func getpopularMovies() {
            NetworkManager.shared.request(model: Movie.self,
                                          url: NetworkHelper.shared.urlConfig(path: "movie/popular")) { movieData, error in
                if let error = error {
                    print("")
                } else if let movieData = movieData {
                    self.category.append(Category(title: "Popular",
                                                  items: movieData.results ?? []))
                    self.successCallback?()
                    
                }
            }
        }
        
        func getTopRatedMovies() {
            NetworkManager.shared.request(model: Movie.self,
                                          url: NetworkHelper.shared.urlConfig(path: "movie/top_rated")) { movieData, error in
                if let error = error {
                    print("")
                } else if let movieData = movieData {
                    self.category.append(Category(title: "Top Rated",
                                                  items: movieData.results ?? []))
                    self.successCallback?()
                    
                    
                }
            }
        }
        func getTopUpcomingMovies() {
            NetworkManager.shared.request(model: Movie.self,
                                          url: NetworkHelper.shared.urlConfig(path: "movie/upcoming")) { movieData, error in
                if let error = error {
                    print("")
                } else if let movieData = movieData {
                    self.category.append(Category(title: "Upcoming",
                                                  items: movieData.results ?? []))
                    self.successCallback?()
                    
                    
                }
            }
        }
        func getTopNowPlayingMovies() {
            NetworkManager.shared.request(model: Movie.self,
                                          url: NetworkHelper.shared.urlConfig(path: "movie/now_playing")) { movieData, error in
                if let error = error {
                    print("")
                } else if let movieData = movieData {
                    self.category.append(Category(title: "Now Playing",
                                                  items: movieData.results ?? []))
                    self.successCallback?()
                    
                    
                }
            }
        }
    }

