import UIKit

final class TabBarController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setupTabBar()
    }

    // MARK: - Private Methods

    private func generateTabBar() {
        viewControllers = [

            generateVC(
                viewController: UINavigationController(rootViewController: MainController()),
                image: UIImage(systemName: "photo.fill")
            ),

            generateVC(
                viewController: FavoritiesController(),
                image: UIImage(systemName: "heart.fill")
            ),
        ]
    }

    private func generateVC(viewController: UIViewController, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }

    private func setupTabBar() {
        tabBar.backgroundColor = UIColor(named: "tabBarColor")
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
