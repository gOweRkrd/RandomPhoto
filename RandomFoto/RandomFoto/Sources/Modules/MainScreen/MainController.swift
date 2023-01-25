//
//  ViewController.swift
//  RandomFoto
//
//  Created by Александр Косяков on 24.01.2023.
//

import UIKit

final class MainController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    private let mainView = MainView()
    private var photos = [UnsplashPhoto]()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        setupSearchBar()
        setupDelegate()
        view.backgroundColor = .white
    }
    
    // MARK: - Private Methods
    
    private func setupNavigationItem() {
        navigationItem.title = "RANDOM FOTO"
    }
    
    private func setupSearchBar() {
        self.navigationItem.searchController = mainView.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupDelegate() {
        mainView.searchController.searchBar.delegate = self
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}

// MARK: - CollectionViewDataSource

extension MainController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return randomFotoItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.data = randomFotoItems[indexPath.item]
        return cell
    }
}
    
    // MARK: - CollectionViewDelegateFlowLayout
    
    extension MainController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: collectionView.frame.width / 2.1, height: collectionView.frame.width / 2)
        }
    }


