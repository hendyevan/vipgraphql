
//  Created by Hendy Evan on 17/02/23.
//

import UIKit

final class LocationsViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var collectionView: UICollectionView!

  // MARK: - Variables
  var input: LocationsInteractorInput?
  var router: LocationsRoutingDelegate?

  var data: [Locations.Model] = []
  private let cellIdentifier = "LocationsItemCell"
  private var maxPage = 1
  private var filter = Locations.Filter()
  private var timer = Timer()
  private var loadingController: LoadingViewController?

  private lazy var searchController: UISearchController = {
    let search = UISearchController(searchResultsController: nil)
    search.searchResultsUpdater = self
    search.delegate = self
    search.obscuresBackgroundDuringPresentation = false
    search.searchBar.placeholder = "Search"
    search.searchBar.autocapitalizationType = .none
    return search
  }()

  private var collectionViewLayout: UICollectionViewLayout {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 15
    layout.scrollDirection = .vertical
    return layout
  }

  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    return refreshControl
  }()

  // MARK: - Initalizer
  init() {
    super.init(nibName: nil, bundle: nil)
    LocationsConfigurator.configure(viewController: self)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    LocationsConfigurator.configure(viewController: self)
  }

  // MARK: - View Lifecycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()

    input?.getAllData(filter: filter)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.prefersLargeTitles = false
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    title = "Location"

    setupNavBarColor()
  }

  // MARK: - Functions
  private func setupCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.refreshControl = refreshControl
    collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    collectionView.collectionViewLayout = collectionViewLayout
    collectionView.reloadData()
  }

  @objc private func searchEpisode() {
    showLoading()
    input?.getAllData(filter: filter)
  }

  @objc private func refreshData() {
    refreshControl.endRefreshing()
    data.removeAll()
    filter.reset()
    input?.getAllData(filter: filter)
  }

  func showLoading() {
    loadingController = LoadingViewController()
    loadingController?.modalPresentationStyle = .overFullScreen
    loadingController?.modalTransitionStyle = .crossDissolve
    guard let controller = loadingController else {return}
    present(controller, animated: true)
  }

  func hideLoading() {
    loadingController?.dismiss(animated: true)
    loadingController = nil
  }
}

// MARK: - UISearchResult Updating and UISearchControllerDelegate  Extension
extension LocationsViewController: UISearchResultsUpdating, UISearchControllerDelegate {
  func updateSearchResults(for searchController: UISearchController) {
    guard
      let keyword = searchController.searchBar.text,
      !keyword.isEmpty,
      keyword != " "
    else {
      return
    }

    filter.name = keyword

    timer.invalidate()
    timer = Timer.scheduledTimer(
      timeInterval: 0.9,
      target: self,
      selector: #selector(searchEpisode),
      userInfo: nil,
      repeats: false
    )
  }
}

// MARK: - Presenter Output
extension LocationsViewController: LocationsPresenterOutput {
  func display(error: String) {
    hideLoading()
    showErrorAlert(error)
  }

  func displayAllData(_ data: [Locations.Model], maxPage: Int) {
    hideLoading()
    self.maxPage = maxPage
    if filter.isFiltering {
      self.data = data
    } else {
      self.data.append(contentsOf: data)
    }
    collectionView.reloadData()
  }
}

// MARK: - UICollectionView Delegate and DataSource
extension LocationsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    data.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard
      let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: cellIdentifier,
        for: indexPath
      ) as? LocationsItemCell
    else {
      return UICollectionViewCell()
    }
    cell.setupCell(data: data[indexPath.row])
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    searchController.searchBar.endEditing(true)
    router?.openDetail(id: data[indexPath.row].id)
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if filter.page < maxPage && indexPath.row == (data.count - 1) {
      filter.page += 1
      input?.getAllData(filter: filter)
    }
  }
}

extension LocationsViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    LocationsItemCell.size
  }
}
