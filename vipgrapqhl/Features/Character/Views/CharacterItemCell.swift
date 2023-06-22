
//  Created by Hendy Evan on 17/02/23.
//

import UIKit
import SDWebImage

final class CharacterItemCell: UICollectionViewCell {
  // MARK: - IBOutlets
  @IBOutlet weak var nameContainerView: UIView!
  @IBOutlet weak var speciesLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!

  // MARK: - Variables
  static func getSize(spacing: CGFloat) -> CGSize {
    let widthPerItem = (UIScreen.getWidth() / 2) - spacing
    return CGSize(width: widthPerItem - 10, height: widthPerItem * 1.3)
  }

  // MARK: - Initializer
  override func awakeFromNib() {
    super.awakeFromNib()
    imageView.roundCorners(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 12.0)
    nameContainerView.roundCorners(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 12.0)
  }

  // MARK: - Functions
  func setupCell(data: Characters.Model) {
    speciesLabel.text = data.species.rawValue
    nameLabel.text = data.name
    imageView.sd_setImage(with: URL(string: data.image))
    nameContainerView.backgroundColor = data.species == .alien ? .greenAlien : .grayHuman
  }
}
