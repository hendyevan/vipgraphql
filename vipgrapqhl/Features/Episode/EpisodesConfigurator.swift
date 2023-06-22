
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

enum EpisodesConfigurator {
  static func configure(viewController: EpisodesViewController) {
    let router = EpisodesRouter(controller: viewController)

    let presenter = EpisodesPresenter(output: viewController)

    let worker = EpisodesWorker()
    let interactor = EpisodesInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
