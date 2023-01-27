import Foundation
import UIKit
import SDWebImage

final class FavoritiesCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    static let reuseId = "LikesCollectionViewCell"

    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            myImageView.sd_setImage(with: url, completed: nil)
        }
    }

    override var isSelected: Bool {
        didSet {
            updateSelectedState()
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

    private let checkmark: UIImageView = {
        let image = UIImage(named: "bird1")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .green
        addSubView()
        setupConstraints()
        updateSelectedState()
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

    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }

    // MARK: - Private Methods

    private func updateSelectedState() {
        myImageView.alpha = isSelected ? 0.7 : 1
        checkmark.alpha = isSelected ? 1 : 0
    }
}

// MARK: - Setup Constrains

extension FavoritiesCollectionViewCell {

    private func addSubView() {

        contentView.addSubview(myImageView)
        contentView.addSubview(checkmark)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        checkmark.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            checkmark.trailingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: -8),
            checkmark.bottomAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: -8)
        ])
    }
}



