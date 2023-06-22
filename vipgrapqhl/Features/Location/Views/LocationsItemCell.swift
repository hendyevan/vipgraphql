
//  Created by Hendy Evan on 18/02/23.
//

import UIKit

final class LocationsItemCell: UICollectionViewCell {
  // MARK: - IBOutlets
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var dimensionLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!

  // MARK: - Variables
  static let size = CGSize(width: UIScreen.getWidth() - 32, height: 80.0)

  // MARK: - Initializer
  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.cornerBorderView(radius: 10)
  }

  // MARK: - Functions
  func setupCell(data: Locations.Model) {
    dimensionLabel.text = data.dimension
    nameLabel.text = data.name
    typeLabel.text = data.type
  }
}
