
//  Created by Hendy Evan on 17/02/23.
//

import UIKit

final class MainViewTabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tabBar.backgroundColor = .background
    self.tabBar.isTranslucent = false

    self.delegate = self

    // Create each tab bar item
    // and set corresponding image and title
    let characterPage = UINavigationController(rootViewController: CharactersViewController())
    characterPage.tabBarItem = UITabBarItem(
      title: "Character",
      image: UIImage(named: "ic_character_unselected"),
      selectedImage: UIImage(named: "ic_character_selected")
    )

    let locationPage = UINavigationController(rootViewController: LocationsViewController())
    locationPage.tabBarItem = UITabBarItem(
      title: "Location",
      image: UIImage(named: "ic_location_unselected"),
      selectedImage: UIImage(named: "ic_location_selected"))

    let episodePage = UINavigationController(rootViewController: EpisodesViewController())
    episodePage.tabBarItem = UITabBarItem(
      title: "Episodes",
      image: UIImage(named: "ic_episode_unselected"),
      selectedImage: UIImage(named: "ic_episode_selected"))

    // Assign tab bar item to `viewControllers`
    // so it will shown up in tab bar controller
    viewControllers = [characterPage, locationPage, episodePage]

    self.selectedIndex = 0
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    // Iterate every item to set rendering image,
    // selected color and unselected color
    if let items = tabBar.items {
      for item in items {
        item.image = item.image?.withRenderingMode(.alwaysOriginal)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.grayTintColor], for: .normal)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blueTintColor], for: .selected)
      }
    }
  }
}

extension MainViewTabBarController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    return true
  }
}
