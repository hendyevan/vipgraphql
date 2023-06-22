
//  Created by Hendy Evan on 18/02/23.
//

import UIKit

final class CharacterFilterHeaderReusableView: UICollectionReusableView {
  // MARK: - IBOutlets
  @IBOutlet weak var titleLabel: UILabel!

  // MARK: - Initializer
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  // MARK: - Functions
  func setupTitle(_ title: String) {
    titleLabel.text = title
  }
}
