
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol EpisodeDetailRoutingDelegate: AnyObject {
  func routeToSomewhere()
}

final class EpisodeDetailRouter: NSObject, EpisodeDetailRoutingDelegate {
  private weak var parentController: EpisodeDetailViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: EpisodeDetailViewController) {
    parentController = controller
  }

  func routeToSomewhere() {
  }
}
