

import UIKit

extension UIViewController {
  /// Show error using `UIAlertController`
  func showErrorAlert(_ message: String?, title: String = "Error", buttonTitle: String = "Close") {
    let alertController = UIAlertController(title: title, message: (message ?? ""), preferredStyle: .alert)
    present(alertController, animated: true, completion: nil)
    alertController.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: nil))
  }

  /// Setup custom navigation bar color,
  /// call in every page for usage
  func setupNavBarColor() {
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.backgroundColor = .background
    navigationController?.navigationBar.standardAppearance = navBarAppearance
    navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    navigationController?.navigationBar.standardAppearance.titleTextAttributes = [
      .foregroundColor: UIColor.black
    ]
  }
}
