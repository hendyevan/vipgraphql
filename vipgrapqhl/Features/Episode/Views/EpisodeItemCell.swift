
//  Created by Hendy Evan on 18/02/23.
//

import UIKit

final class EpisodeItemCell: UICollectionViewCell {
  // MARK: - IBOutlets
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var airDateLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var episodeLabel: UILabel!
  @IBOutlet weak var seasonLabel: UILabel!

  // MARK: - Variables
  static let size = CGSize(width: UIScreen.getWidth() - 32, height: 116)

  // MARK: - Initializer
  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.cornerBorderView(radius: 10)
  }

  // MARK: - Functions
  func setupCell(data: Episodes.Model) {
    airDateLabel.text = data.airDate
    nameLabel.text = data.name
    episodeLabel.text = "episode: \(data.episode)"
    seasonLabel.text = "season: \(data.season)"
  }
}
