import UIKit

final class FavoritiesController: UICollectionViewController {

    // MARK: - Properties

    var photos = [UnsplashPhoto]()
    private var selectedImages = [UIImage]()

    private var numberOfSelectedPhotosFav: Int {
        return collectionView.indexPathsForSelectedItems?.count ?? 0
    }

    // MARK: - UI Elements Navigation Bar

    private lazy var trashBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeBarButtonTapped))
    }()

    private func updateNavButtonsStateFav() {
        trashBarButtonItem.isEnabled = numberOfSelectedPhotosFav > 0
    }

    // MARK: - UI Elements

    private let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "You haven't add a photos yet"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupEnterLabel()
        setupNavigationBar()
        setupCollectionView()
    }

    // MARK: - Public Methods

    func refresh() {
        self.selectedImages.removeAll()
        self.collectionView.selectItem(at: nil, animated: true, scrollPosition: [])
        updateNavButtonsStateFav()
    }

    // MARK: - Setup UI Elements

    private func setupCollectionView() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        collectionView.backgroundColor = .white
        collectionView.register(FavoritiesCollectionViewCell.self, forCellWithReuseIdentifier: FavoritiesCollectionViewCell.reuseId)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // permission to select more than one cell
        collectionView.allowsMultipleSelection = true
    }

    private func setupNavigationBar() {
        let titleLabel = UILabel(text: "FAVOURITES", font: .systemFont(ofSize: 15, weight: .medium), textColor: #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 1))
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.rightBarButtonItem = trashBarButtonItem
        trashBarButtonItem.isEnabled = false
    }

    // MARK: - NavigationItems action

    @objc
    private func removeBarButtonTapped() {
        print(#function)
        let selectedPhotos = collectionView.indexPathsForSelectedItems?.reduce([], { (photosss, indexPath) -> [UnsplashPhoto] in
            var mutablePhotos = photosss
            let photo = photos[indexPath.item]
            mutablePhotos.append(photo)
            return mutablePhotos
        })

        let alertController = UIAlertController(title: "", message: "\(selectedPhotos!.count) photos will be deleted from favorites", preferredStyle: .alert)
        let add = UIAlertAction(title: "Delete", style: .default) { (_) in
            let tabbar = self.tabBarController as! MainTabBarController
            let navVC = tabbar.viewControllers?[1] as! UINavigationController
            let likesVC = navVC.topViewController as! FavoritiesController

            likesVC.photos.append(contentsOf: selectedPhotos ?? [])

            likesVC.collectionView.reloadData()


            self.refresh()
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
        }

        alertController.addAction(cancel)
        alertController.addAction(add)
        present(alertController, animated: true)
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = photos.count != 0
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritiesCollectionViewCell.reuseId, for: indexPath) as! FavoritiesCollectionViewCell
        let unsplashPhoto = photos[indexPath.item]
        cell.unsplashPhoto = unsplashPhoto
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateNavButtonsStateFav()
        let cell = collectionView.cellForItem(at: indexPath) as! FavoritiesCollectionViewCell
        guard let image = cell.myImageView.image else { return }
        selectedImages.append(image)

    }

    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        updateNavButtonsStateFav()
        let cell = collectionView.cellForItem(at: indexPath) as! FavoritiesCollectionViewCell
        guard let image = cell.myImageView.image else { return }
        if let index = selectedImages.firstIndex(of: image) {
            selectedImages.remove(at: index)
        }
    }
}

    // MARK: - UICollectionViewDelegateFlowLayout

extension FavoritiesController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width/3 - 1, height: width/3 - 1)
    }
}

// MARK: - Setup Constrains

extension FavoritiesController {

    private func setupEnterLabel() {
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        enterSearchTermLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 50).isActive = true
    }
}
