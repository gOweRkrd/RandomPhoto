//
//  MainView.swift
//  RandomFoto
//
//  Created by Александр Косяков on 24.01.2023.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - UI Elements
    
    lazy var searchController = UISearchController(searchResultsController: nil)
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

extension MainView {
    
    func addSubView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: self.topAnchor,constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor),
        ])
    }
}

// MARK: - Constant Constrains

private extension CGFloat {
    static let leadingMargin: CGFloat = 10
    
}
