
//  Created by Hendy Evan on 17/02/23.
//

import UIKit
import SDWebImage

final class CharacterDetailViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var genderLabel: UILabel!
  @IBOutlet weak var speciesLabel: UILabel!
  @IBOutlet weak var statusImageView: UIImageView!
  @IBOutlet weak var genderImageView: UIImageView!
  @IBOutlet weak var createdLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var originLabel: UILabel!
  @IBOutlet weak var episodeLabel: UILabel!

  // MARK: - Variables
  var input: CharacterDetailInteractorInput?
  var router: CharacterDetailRoutingDelegate?

  var id = ""
  private var loadingController: LoadingViewController?
  private var activityIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView(
      frame: CGRect(
        x: UIScreen.getWidth() / 2 - 50,
        y: UIScreen.getHeight() / 2,
        width: 100,
        height: 100
      )
    )
    indicator.startAnimating()
    indicator.hidesWhenStopped = true
    indicator.style = .large
    indicator.color = .darkGray
    return indicator
  }()

  // MARK: - Initializer
  init(id: String) {
    super.init(nibName: nil, bundle: nil)
    CharacterDetailConfigurator.configure(viewController: self)
    self.id = id
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    CharacterDetailConfigurator.configure(viewController: self)
  }

  // MARK: - View Lifecycles
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(activityIndicator)
    imageView.roundCorners(radius: 10)
    input?.getCharacterBy(id: id)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.prefersLargeTitles = false
    navigationController?.navigationBar.topItem?.backButtonTitle = "Back"
  }

  // MARK: - Functions
  func hideLoading() {
    activityIndicator.removeFromSuperview()
  }
}

// MARK: - Presenter Output
extension CharacterDetailViewController: CharacterDetailPresenterOutput {
  func display(error: String) {
    hideLoading()
    showErrorAlert(error)
  }

  func displayCharacterDetail(_ detail: CharacterDetail.Model) {
    hideLoading()
    imageView.sd_setImage(with: URL(string: detail.image))
    nameLabel.text = detail.name
    statusLabel.text = "Status: \(detail.status.rawValue)"
    genderLabel.text = "Gender: \(detail.gender.rawValue)"
    speciesLabel.text = "Species: \(detail.species.rawValue)"

    statusImageView.image = detail.status.getImage()
    genderImageView.image = detail.gender.getImage()

    createdLabel.text = detail.createdAt
    originLabel.text = detail.origin
    locationLabel.text = detail.location

    episodeLabel.text = detail.episodes.joined(separator: "\n")
    title = detail.name
  }
}
