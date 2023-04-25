//
//  PersonCell.swift
//  MovieApp
//
//  Created by Araz Muradov on 17.04.23.
//

import UIKit
class PersonCell: UICollectionViewCell {
    
    @IBOutlet private weak var personImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    func configure(data: PersonResult?) {
        nameLabel.text = data?.name ?? ""
        personImage.loadUrl(posterPath: data?.profilePath ?? "")
        personImage.layer.cornerRadius = 12
        personImage.clipsToBounds = true
        }
     }
