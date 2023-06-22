
//  Created by Hendy Evan on 18/02/23.
//

import UIKit

final class EpisodeDetailViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var charactersLabel: UILabel!
  @IBOutlet weak var seasonLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var createdLabel: UILabel!
  @IBOutlet weak var episodeLabel: UILabel!
  @IBOutlet weak var airDateLabel: UILabel!

  // MARK: - Variables
  var input: EpisodeDetailInteractorInput?
  var router: EpisodeDetailRoutingDelegate?

  var id = ""
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
    EpisodeDetailConfigurator.configure(viewController: self)
    self.id = id
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    EpisodeDetailConfigurator.configure(viewController: self)
  }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(activityIndicator)
    input?.getEpisodeBy(id: id)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupNavBarColor()
  }

  // MARK: - Functions
  func hideLoading() {
    activityIndicator.removeFromSuperview()
  }
}

// MARK: - Presenter Output
extension EpisodeDetailViewController: EpisodeDetailPresenterOutput {
  func display(error: String) {
    hideLoading()
    showErrorAlert(error)
  }

  func displayEpisodeDetail(_ detail: EpisodeDetail.Model) {
    hideLoading()
    title = detail.name
    charactersLabel.text = detail.charactes.compactMap { $0.name }.joined(separator: "\n")
    airDateLabel.text = detail.airDate
    nameLabel.text = detail.name
    seasonLabel.text = "Season: \(detail.season)"
    episodeLabel.text = "Episode: \(detail.episode)"
    createdLabel.text = detail.created
  }
}
