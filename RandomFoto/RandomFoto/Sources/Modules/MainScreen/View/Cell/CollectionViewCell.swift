//
//  MainViewCell.swift
//  RandomFoto
//
//  Created by Александр Косяков on 24.01.2023.
//

import UIKit
import SDWebImage

final class CollectionViewCell: UICollectionViewCell {

    var data: ColletionData? {
        didSet {
            guard let data = data else { return }
            imageView.image = data.image
        }
    }
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            imageView.sd_setImage(with: url, completed: nil)
        }
    }

    // MARK: - UI Elements

     let imageView: UIImageView = {

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let checkmark: UIImageView = {
        let image = UIImage(named: "bird1")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()

    
    override var isSelected: Bool {
        didSet {
            updateSelectedState()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func updateSelectedState() {
        imageView.alpha = isSelected ? 0.7 : 1
        checkmark.alpha = isSelected ? 1 : 0
    }
    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: .zero)

        addSubView()
        setupConstraints()
        updateSelectedState()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constrains

private extension CollectionViewCell {

    private func addSubView() {

        contentView.addSubview(imageView)
        contentView.addSubview(checkmark)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        checkmark.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            checkmark.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
            checkmark.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8)

        ])
    }
}

