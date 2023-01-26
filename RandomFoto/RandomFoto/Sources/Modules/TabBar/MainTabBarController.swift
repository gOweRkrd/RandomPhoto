import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let photosVC = MainFotoController(collectionViewLayout: UICollectionViewFlowLayout())

        let likesVC = FavoritiesController(collectionViewLayout: UICollectionViewFlowLayout())

        viewControllers = [
            generateNavigationController(rootViewController: photosVC, title: "Photos", image: #imageLiteral(resourceName: "photos 1")),
            generateNavigationController(rootViewController: likesVC, title: "Favourites", image: #imageLiteral(resourceName: "heart 1"))
        ]
    }

    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
