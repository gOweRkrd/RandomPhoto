//
//  GalleryCollectionViewCell.swift
//  IPhotosV2
//
//  Created by Алексей Пархоменко on 27/07/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class FavoritiesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseId = "LikesCollectionViewCell"
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"] // спорный момент, лично для меня
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            myImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    // MARK: - UI Elements
    
    var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func set(photo: UnsplashPhoto) {
        let photoUrl = photo.urls["full"]
        guard let photoURL = photoUrl, let url = URL(string: photoURL) else { return }
        myImageView.sd_setImage(with: url, completed: nil)
    }
}


// MARK: - Setup Constrains

extension FavoritiesCollectionViewCell {
    
    func addSubView() {
        addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

