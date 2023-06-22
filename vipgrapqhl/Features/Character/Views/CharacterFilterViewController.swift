
//  Created by Hendy Evan on 18/02/23.
//

import UIKit

protocol CharacterFilterDelegate: AnyObject {
  func didApplyFilter(_ filter: Characters.Filter)
}

final class CharacterFilterViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var applyButton: UIButton!
  @IBOutlet weak var collectionView: UICollectionView!

  // MARK: - Variables
  private var filter = Characters.Filter()
  private let cellIdentifier = "CharacterFilterItemCell"
  private let headerIdentifier = "CharacterFilterHeaderReusableView"
  private weak var delegate: CharacterFilterDelegate?
  var menu: [Characters.FilterMenu] = []

  private var collectionViewLayout: UICollectionViewLayout {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 8
    layout.minimumLineSpacing = 8
    return layout
  }

  // MARK: - Initializer
  init(filter: Characters.Filter, delegate: CharacterFilterDelegate?) {
    super.init(nibName: nil, bundle: nil)
    self.filter = filter
    self.delegate = delegate
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  // MARK: - View Lifecycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    constructFilterMenu()

    applyButton.roundCorners(radius: 10)
  }

  // MARK: - Functions
  func setupCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.contentInset = .zero
    collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    collectionView.collectionViewLayout = collectionViewLayout
    collectionView.register(
      UINib(nibName: headerIdentifier, bundle: nil),
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: headerIdentifier
    )
  }

  @IBAction func didTapApply(_ sender: UIButton) {
    dismiss(animated: true) {
      self.delegate?.didApplyFilter(self.filter)
    }
  }

  func constructFilterMenu() {
    let statusMenu = Characters.FilterMenu(section: .status, items: Characters.Status.allCases.map {
      Characters.FilterItem(
        name: $0.rawValue,
        isSelected: $0 == filter.status
      )
    })

    let speciesMenu = Characters.FilterMenu(section: .species, items: Characters.Species.allCases.map {
      Characters.FilterItem(
        name: $0.rawValue,
        isSelected: $0 == filter.species
      )
    })

    let genderMenu = Characters.FilterMenu(section: .gender, items: Characters.Gender.allCases.map {
      Characters.FilterItem(
        name: $0.rawValue,
        isSelected: $0 == filter.gender
      )
    })

    menu = [statusMenu, speciesMenu, genderMenu]
    collectionView.reloadData()
  }

  func updateSelection(indexPath: IndexPath) {
    for i in 0..<menu[indexPath.section].items.count {
      menu[indexPath.section].items[i].isSelected = false
    }

    let text = menu[indexPath.section].items[indexPath.row].name
    menu[indexPath.section].items[indexPath.row].isSelected = true

    switch menu[indexPath.section].section {
    case .gender: filter.gender = Characters.Gender(rawValue: text) ?? .none
    case .status: filter.status = Characters.Status(rawValue: text) ?? .none
    case .species: filter.species = Characters.Species(rawValue: text) ?? .none
    }

    collectionView.reloadData()
  }
}

extension CharacterFilterViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    menu.count
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    menu[section].items.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard
      let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: cellIdentifier,
        for: indexPath
      ) as? CharacterFilterItemCell
    else {
      return UICollectionViewCell()
    }
    let item = menu[indexPath.section].items[indexPath.row]
    cell.setupCell(label: item.name, isSelected: item.isSelected)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    updateSelection(indexPath: indexPath)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    CGSize(width: collectionView.frame.width, height: 40.0)
  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    guard
      kind == UICollectionView.elementKindSectionHeader,
      let header = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: headerIdentifier,
        for: indexPath
      ) as? CharacterFilterHeaderReusableView
    else {
      return UICollectionReusableView()
    }
    header.setupTitle(menu[indexPath.section].section.rawValue)
    return header
  }
}

extension CharacterFilterViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CharacterFilterItemCell.getSize(label: menu[indexPath.section].items[indexPath.row].name)
  }
}
