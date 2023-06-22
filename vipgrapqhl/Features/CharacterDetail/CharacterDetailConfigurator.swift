
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

enum CharacterDetailConfigurator {
  static func configure(viewController: CharacterDetailViewController) {
    let router = CharacterDetailRouter(controller: viewController)

    let presenter = CharacterDetailPresenter(output: viewController)

    let worker = CharacterDetailWorker()
    let interactor = CharacterDetailInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
