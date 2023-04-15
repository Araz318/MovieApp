//
//  HomeCell.swift
//  MovieApp
//
//  Created by Araz Muradov on 15.04.23.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var collection: UICollectionView!
    
    private var movieItems = [MovieResult]()
    
    func configure(data: Category) {
        movieItems = data.items
        nameLabel.text = data.title
        collection.reloadData()
    }
}

extension HomeCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MovieCell.self)", for: indexPath) as! MovieCell
        
        cell.configure(data: movieItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 167, height: collectionView.frame.height)
    }
}
