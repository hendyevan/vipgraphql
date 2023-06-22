
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

enum LocationDetailConfigurator {
  static func configure(viewController: LocationDetailViewController) {
    let router = LocationDetailRouter(controller: viewController)

    let presenter = LocationDetailPresenter(output: viewController)

    let worker = LocationDetailWorker()
    let interactor = LocationDetailInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
