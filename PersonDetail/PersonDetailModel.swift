//
//  PersonDetailModel.swift
//  MovieApp
//
//  Created by Araz Muradov on 22.04.23.
//

import Foundation



struct Cast: Codable {
    let cast, crew: [CastResult]?
    let id: Int?
}


struct CastResult: Codable,DetailProtocol {
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
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?
    let department: String?
    let job: String?

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
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}

enum Department: String, Codable {
    case camera = "Camera"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case production = "Production"
    case writing = "Writing"
}

enum Job: String, Codable {
    case author = "Author"
    case cameraOperator = "Camera Operator"
    case director = "Director"
    case editor = "Editor"
    case firstAssistantDirector = "First Assistant Director"
    case presenter = "Presenter"
    case producer = "Producer"
    case screenplay = "Screenplay"
    case story = "Story"
    case writer = "Writer"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case fr = "fr"
    case it = "it"
    case ru = "ru"
    case sh = "sh"
}
