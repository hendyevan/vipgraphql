
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol CharacterDetailRoutingDelegate: AnyObject {
  func routeToSomewhere()
}

final class CharacterDetailRouter: NSObject, CharacterDetailRoutingDelegate {
  private weak var parentController: CharacterDetailViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: CharacterDetailViewController) {
    parentController = controller
  }

  func routeToSomewhere() {
  }
}
