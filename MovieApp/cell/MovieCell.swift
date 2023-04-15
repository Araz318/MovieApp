//
//  MovieCell.swift
//  MovieApp
//
//  Created by Araz Muradov on 15.04.23.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(data: MovieResult) {
        titleLabel.text = data.title
        posterImage.loadUrl(posterPath: data.posterPath ?? "")
    }
}
    

