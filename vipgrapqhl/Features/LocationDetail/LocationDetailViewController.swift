
//  Created by Hendy Evan on 18/02/23.
//

import UIKit

final class LocationDetailViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var dimensionLabel: UILabel!
  @IBOutlet weak var createdLabel: UILabel!
  @IBOutlet weak var residentsLabel: UILabel!

  // MARK: - Variables
  var input: LocationDetailInteractorInput?
  var router: LocationDetailRoutingDelegate?

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
    LocationDetailConfigurator.configure(viewController: self)
    self.id = id
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    LocationDetailConfigurator.configure(viewController: self)
  }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(activityIndicator)
    input?.getLocationBy(id: id)
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
extension LocationDetailViewController: LocationDetailPresenterOutput {
  func display(error: String) {
    hideLoading()
    showErrorAlert(error)
  }

  func displayLocationDetail(_ detail: LocationDetail.Model) {
    hideLoading()
    nameLabel.text = detail.name
    typeLabel.text = "Type: \(detail.type)"
    dimensionLabel.text = detail.dimension
    createdLabel.text = detail.created
    residentsLabel.text = detail.residents.compactMap { $0.name }.joined(separator: "\n")
    title = detail.name
  }
}
