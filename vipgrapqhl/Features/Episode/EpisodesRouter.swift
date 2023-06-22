
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol EpisodesRoutingDelegate: AnyObject {
  func openDetail(id: String)
}

final class EpisodesRouter: EpisodesRoutingDelegate {
  private weak var parentController: EpisodesViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: EpisodesViewController) {
    parentController = controller
  }

  func openDetail(id: String) {
    let detailVC = EpisodeDetailViewController(id: id)
    parentController?.present(UINavigationController(rootViewController: detailVC), animated: true)
  }
}
