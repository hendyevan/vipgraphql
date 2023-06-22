
//  Created by Hendy Evan on 17/02/23.
//

import UIKit

final class CharactersViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var collectionView: UICollectionView!

  // MARK: - Variables
  var input: CharactersInteractorInput?
  var router: CharactersRoutingDelegate?

  var data: [Characters.Model] = []
  private let cellIdentifier = "CharacterItemCell"
  private var filter = Characters.Filter()
  private var maxPage = 1
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

  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    return refreshControl
  }()

  private var collectionViewLayout: UICollectionViewLayout {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 23
    layout.minimumLineSpacing = 38
    layout.scrollDirection = .vertical
    return layout
  }

  // MARK: - Initializer
  init() {
    super.init(nibName: nil, bundle: nil)
    CharactersConfigurator.configure(viewController: self)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    CharactersConfigurator.configure(viewController: self)
  }

  // MARK: - View Lifecycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()

    input?.getAllData(filter: filter)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    title = "Character"

    setupNavBarColor()

    let filterBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "slider.horizontal.3"),
      style: .plain,
      target: self,
      action: #selector(onFilterButtonClicked)
    )

    self.navigationItem.rightBarButtonItem = filterBarButtonItem
  }

  // MARK: - Functions
  private func setupCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.refreshControl = refreshControl
    collectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    collectionView.collectionViewLayout = collectionViewLayout
    collectionView.reloadData()
  }

  @objc func onFilterButtonClicked(_ sender: Any) {
    router?.openFilter(filter)
  }

  @objc private func searchCharacter() {
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

// MARK: - UISearchResult Updating and UISearchControllerDelegate Extension
extension CharactersViewController: UISearchResultsUpdating, UISearchControllerDelegate {
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
      selector: #selector(searchCharacter),
      userInfo: nil,
      repeats: false
    )
  }
}

// MARK: - Presenter Output
extension CharactersViewController: CharactersPresenterOutput {
  func displayAllData(_ data: [Characters.Model], maxPage: Int) {
    hideLoading()
    self.maxPage = maxPage
    if filter.isFiltering {
      self.data = data
    } else {
      self.data.append(contentsOf: data)
    }
    collectionView.reloadData()
  }

  func display(error: String) {
    hideLoading()
    showErrorAlert(error)
  }
}

// MARK: - Filter Delegate
extension CharactersViewController: CharacterFilterDelegate {
  func didApplyFilter(_ filter: Characters.Filter) {
    showLoading()
    self.filter = filter
    input?.getAllData(filter: filter)
  }
}

// MARK: - UICollectionView Delegate and DataSource
extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
      ) as? CharacterItemCell
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

// MARK: - UICollectionView Flow Layout Delegate
extension CharactersViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    // swiftlint:disable:next force_cast
    let lay = collectionViewLayout as! UICollectionViewFlowLayout
    return CharacterItemCell.getSize(spacing: lay.minimumInteritemSpacing)
  }
}
