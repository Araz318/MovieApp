//
//  UIImageView+Extension.swift
//  MovieApp
//
//  Created by Araz Muradov on 15.04.23.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadUrl(posterPath: String) {
        let posterBaseURL = "https://image.tmdb.org/t/p/original"
        if let url = URL(string: posterBaseURL + posterPath) {
            self.sd_setImage(with: url)
        }
    }
}
