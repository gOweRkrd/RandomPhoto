//
//  FavoritiesView.swift
//  RandomFoto
//
//  Created by Александр Косяков on 24.01.2023.
//

import UIKit

final class FavoritiesView: UIView {

    // MARK: - UI Elements
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FavoritiesCollectionViewCell.self, forCellWithReuseIdentifier: FavoritiesCollectionViewCell.reuseId)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return collectionView
    }()
    
     let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "You haven't add a photos yet"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

extension FavoritiesView {
    
    func addSubView() {
        collectionView.addSubview(enterSearchTermLabel)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            enterSearchTermLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            enterSearchTermLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 50)
        ])
    }
}

