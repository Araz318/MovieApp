//
//  SearchController.swift
//  MovieApp
//
//  Created by Araz Muradov on 01.05.23.
//

import UIKit

class SearchController: UIViewController {
    @IBOutlet weak var searchcollection: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var searchModel = SearchViewModel()
    private let cellId = "\(DetailCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        configreUI()
        configsearchModel()
    }
    
    func configsearchModel() {
        searchModel.successCallback = {
            self.searchcollection.reloadData()
        }
    }
    
    func configreUI() {
        searchcollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
        
    @IBAction func searchTextFieldAction(_ sender: Any) {
        if !(searchTextField.text?.isEmpty ?? false) {
            searchModel.getSearch(text: searchTextField.text ?? "")
        }
        
    }
}
extension SearchController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchModel.search.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailCell
        cell.configure(data: searchModel.search[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: searchcollection.frame.width , height: 120)
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        viewModel.pagination(index: indexPath.item)
//    }
}

extension SearchController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? false {
            searchModel.resetDatas()
            searchcollection.reloadData()
        }
        textField.resignFirstResponder()
        return true
    }
}

