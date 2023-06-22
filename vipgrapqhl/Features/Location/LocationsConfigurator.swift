
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

enum LocationsConfigurator {
  static func configure(viewController: LocationsViewController) {
    let router = LocationsRouter(controller: viewController)

    let presenter = LocationsPresenter(output: viewController)

    let worker = LocationsWorker()
    let interactor = LocationsInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
