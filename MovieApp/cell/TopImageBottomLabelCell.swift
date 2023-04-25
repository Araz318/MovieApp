//
//  TopImageBottomLabelCell.swift
//  MovieApp
//
//  Created by Araz Muradov on 19.04.23.
//

import UIKit
protocol TopImageBottomLabellCellProtocol {
    var titletext: String { get }
    var imageUrl: String { get }
}

class TopImageBottomLabelCell: UICollectionViewCell {
    @IBOutlet private weak var topImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
            super.awakeFromNib()
            topImage.layer.cornerRadius = 12
        }
    
    
    func configure (data:TopImageBottomLabellCellProtocol) {
        titleLabel.text = data.titletext
        topImage.loadUrl(posterPath: data.imageUrl)
    }
}
