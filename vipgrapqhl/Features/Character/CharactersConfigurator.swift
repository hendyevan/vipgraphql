
//  Created by Hendy Evan on 17/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

enum CharactersConfigurator {
  static func configure(viewController: CharactersViewController) {
    let router = CharactersRouter(controller: viewController)

    let presenter = CharactersPresenter(output: viewController)

    let worker = CharactersWorker()
    let interactor = CharactersInteractor(output: presenter, worker: worker)

    viewController.input = interactor
    viewController.router = router
  }
}
