
//  Created by Hendy Evan on 17/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocols
protocol CharactersInteractorInput: AnyObject {
  func getAllData(filter: Characters.Filter)
}

protocol CharactersInteractorOutput: AnyObject {
  func presentAllData(_ response: CharactersResult?)
  func present(error: NSError)
}

// MARK: Class
final class CharactersInteractor: CharactersInteractorInput {
  private var output: CharactersInteractorOutput?
  private var worker: CharactersWorkerProtocol?

  required init(output: CharactersInteractorOutput, worker: CharactersWorkerProtocol) {
    self.output = output
    self.worker = worker
  }

  // MARK: Business logic
  func getAllData(filter: Characters.Filter) {
    worker?.getAllData(filter: filter) { result in
      switch result {
      case .success(let response): self.output?.presentAllData(response)
      case .failure(let error): self.output?.present(error: error)
      }
    }
  }
}
