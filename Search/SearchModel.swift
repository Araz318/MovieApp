//
//  SearchModel.swift
//  MovieApp
//
//  Created by Araz Muradov on 30.04.23.
//

import Foundation
// MARK: - Search
struct Search: Codable {
    let page: Int?
    let results: [SearchResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct SearchResult: Codable,DetailProtocol {
    var storytext: String {
    title ?? ""
    }
    var ratingtext: String{
        "\(voteAverage ?? 0.0)"
    }
    
    var timetext: String{
        releaseDate ?? ""
    }
    
    var imageUrl: String{
    return posterPath ?? ""
    }
    
   
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

