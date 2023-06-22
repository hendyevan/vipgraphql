
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

enum EpisodeDetailConfigurator {
  static func configure(viewController: EpisodeDetailViewController) {
    let router = EpisodeDetailRouter(controller: viewController)

    let presenter = EpisodeDetailPresenter(output: viewController)

    let worker = EpisodeDetailWorker()
    let interactor = EpisodeDetailInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
