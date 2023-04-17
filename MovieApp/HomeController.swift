//
//  HomeController.swift
//  MovieApp
//
//  Created by Araz Muradov on 15.04.23.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.showsVerticalScrollIndicator = false
        


       
        title = "Movie"
        configViewModel()
        configCollection()
    }
    
    func configViewModel() {
        viewModel.getpopularMovies()
        viewModel.getTopRatedMovies()
        viewModel.getTopUpcomingMovies()
        viewModel.getTopNowPlayingMovies()
        viewModel.successCallback = {
            self.collection.reloadData()
        }
    }
    
    func configCollection() {
        
    }

}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
        cell.configure(data: viewModel.category[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 318)
    }
}
