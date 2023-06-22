
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol LocationDetailRoutingDelegate: AnyObject {
  func routeToSomewhere()
}

final class LocationDetailRouter: NSObject, LocationDetailRoutingDelegate {
  private weak var parentController: LocationDetailViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: LocationDetailViewController) {
    parentController = controller
  }

  func routeToSomewhere() {
  }
}
