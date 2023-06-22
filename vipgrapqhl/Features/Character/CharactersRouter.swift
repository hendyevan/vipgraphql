
//  Created by Hendy Evan on 17/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CharactersRoutingDelegate: AnyObject {
  func openDetail(id: String)
  func openFilter(_ filter: Characters.Filter)
}

final class CharactersRouter: CharactersRoutingDelegate {
  private weak var parentController: CharactersViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: CharactersViewController) {
    parentController = controller
  }

  func openDetail(id: String) {
    let detailVC = CharacterDetailViewController(id: id)
    detailVC.hidesBottomBarWhenPushed = true
    navController?.pushViewController(detailVC, animated: true)
  }

  func openFilter(_ filter: Characters.Filter) {
    let filterVC = CharacterFilterViewController(filter: filter, delegate: parentController)
    if let sheet = filterVC.sheetPresentationController {
      sheet.detents = [.medium(), .large()]
      sheet.preferredCornerRadius = 10
      sheet.prefersGrabberVisible = true
      sheet.prefersScrollingExpandsWhenScrolledToEdge = true
    }
    parentController?.present(filterVC, animated: true)
  }
}
