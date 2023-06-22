
//  Created by Hendy Evan on 18/02/23.
//

import UIKit

final class CharacterFilterItemCell: UICollectionViewCell {
  // MARK: - IBOutlets
  @IBOutlet weak var menuContainerView: UIView!
  @IBOutlet weak var menuLabel: UILabel!

  // MARK: - Variables
  static func getSize(label: String) -> CGSize {
    let height: CGFloat = 35
    let width = label.getTextWidth(
      height: height,
      margin: 16,
      font: UIFont.systemFont(ofSize: 14, weight: .semibold)
    )
    return CGSize(width: width + 4, height: height)
  }

  // MARK: - Initializer
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  // MARK: - Functions
  func setupCell(label: String, isSelected: Bool) {
    let color: UIColor = isSelected ? .blueTintColor : .grayTintColor
    menuContainerView.cornerBorderView(radius: 10, borderColor: color)
    menuLabel.text = label
    menuLabel.textColor = color
  }
}
