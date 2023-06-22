
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LocationsRoutingDelegate: AnyObject {
  func openDetail(id: String)
}

final class LocationsRouter: NSObject, LocationsRoutingDelegate {
  private weak var parentController: LocationsViewController?
  private var navController: UINavigationController? { parentController?.navigationController }

  required init(controller: LocationsViewController) {
    parentController = controller
  }

  func openDetail(id: String) {
    let detailVC = LocationDetailViewController(id: id)
    parentController?.present(UINavigationController(rootViewController: detailVC), animated: true)
  }
}
