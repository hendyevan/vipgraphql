

import UIKit

extension UIView {
  /// Create rounded corner in specific corner
  /// - Paramaters:
  ///     - corners: Specific corner to round
  ///     - radius: Value of radius for corner
  func roundCorners(corners: CACornerMask, radius: CGFloat) {
    clipsToBounds = true
    layer.cornerRadius = radius
    layer.maskedCorners = corners
  }

  /// Create round in all corner
  /// - Paramaters:
  ///     - radius: Value of radius for corner
  func roundCorners(radius: CGFloat) {
    clipsToBounds = true
    layer.cornerRadius = radius
  }

  /// Create border for view and round all corner
  /// - Paramaters:
  ///     - radius: Value of radius for corner
  ///     - borderWeight: Weight for the border, default is `1.0`
  ///     - borderColor: Color for the border, default is `black`
  func cornerBorderView(
    radius: CGFloat,
    borderWeight: CGFloat = 1.0,
    borderColor: UIColor = .black
  ) {
    layer.cornerRadius = radius
    layer.borderWidth = borderWeight
    layer.borderColor = borderColor.cgColor
  }
}
