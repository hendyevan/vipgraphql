
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocols
protocol CharacterDetailInteractorInput: AnyObject {
  func getCharacterBy(id: String)
}

protocol CharacterDetailInteractorOutput: AnyObject {
  func presentCharacter(_ response: CharacterDetailResult?)
  func present(error: NSError)
}

// MARK: Class
final class CharacterDetailInteractor: CharacterDetailInteractorInput {
  private var output: CharacterDetailInteractorOutput?
  private var worker: CharacterDetailWorkerProtocol?

  required init(output: CharacterDetailInteractorOutput, worker: CharacterDetailWorkerProtocol) {
    self.output = output
    self.worker = worker
  }

  // MARK: Business logic
  func getCharacterBy(id: String) {
    worker?.getCharacterBy(id: id) { result in
      switch result {
      case .success(let response): self.output?.presentCharacter(response)
      case .failure(let error): self.output?.present(error: error)
      }
    }
  }
}
