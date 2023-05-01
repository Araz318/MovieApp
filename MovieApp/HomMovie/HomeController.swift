//
//  HomeController.swift
//  MovieApp
//
//  Created by Araz Muradov on 15.04.23.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    @IBOutlet weak var ListButton: UIBarButtonItem!
    
    var viewModel = HomeViewModel()
    private let cellId = "\(TopImageBottomLabelCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.showsVerticalScrollIndicator = false
        title = "Movie"
        configViewModel()
        configCollection()
        
    }
    
    func configViewModel() {
        viewModel.getItems()
        viewModel.successCallback = {
            self.collection.reloadData()
        }
        viewModel.errorCallback = { message in
            self.showAlert(title: "Error", message: "Uyari", buttonText: "OKEY" )
        }
    }
    func showAlert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonText, style: .default, handler: nil)
        alert.addAction(okAction)
        
    }
    
    func configCollection() {
title = NSLocalizedString("home_title", comment: "")
    
    }
    @IBAction func listButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewController = UITableViewController(style: .plain)
                let popoverController = tableViewController.popoverPresentationController
                popoverController?.barButtonItem = ListButton
                present(tableViewController, animated: true, completion: nil)
    }
    
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchController")
           self.navigationController?.pushViewController(viewController, animated: true)
        
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
