
import UIKit

extension UIScreen {
  /// Get width from UI Screen
  static func getWidth() -> CGFloat {
    return UIScreen.main.bounds.size.width
  }

  /// Get height from UI Screen
  static func getHeight() -> CGFloat {
    return UIScreen.main.bounds.size.height
  }
}
