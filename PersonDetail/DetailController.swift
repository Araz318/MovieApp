//
//  DetailController.swift
//  MovieApp
//
//  Created by Araz Muradov on 23.04.23.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var detailCollection: UICollectionView!
    var detailModel = DetailViewModel()
    private let cellId = "\(DetailCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configreUI()
        detailCollection.showsVerticalScrollIndicator = false
        configdetailModel()
        title = "Movie List"

        
    }
    func configdetailModel() {
        detailModel.getDetail()
        detailModel.successCallback = {
            self.detailCollection.reloadData()
        }
    }
    
    
    
    func configreUI () {
        detailCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    

  
}
extension DetailController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailModel.cast.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailCell
        cell.configure(data: detailModel.cast[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
        
       }

   }
