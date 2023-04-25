//
//  DetailCell.swift
//  MovieApp
//
//  Created by Araz Muradov on 22.04.23.
//

import UIKit
protocol DetailProtocol {
    var storytext: String { get }
    var ratingtext: String { get }
    var timetext: String { get }
    var imageUrl: String { get }
}

class DetailCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var storyLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure (data:DetailProtocol) {
        storyLabel.text = data.storytext
        imageMovie.loadUrl(posterPath: data.imageUrl)
        ratingLabel.text = data.ratingtext
        timeLabel.text = data.timetext 
    }

}
