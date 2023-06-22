
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocols
protocol EpisodesInteractorInput: AnyObject {
  func getAllData(filter: Episodes.Filter)
}

protocol EpisodesInteractorOutput: AnyObject {
  func presentAllData(_ response: EpisodesResult?)
  func present(error: NSError)
}

// MARK: Class
final class EpisodesInteractor: EpisodesInteractorInput {
  private var output: EpisodesInteractorOutput?
  private var worker: EpisodesWorkerProtocol?

  required init(output: EpisodesInteractorOutput, worker: EpisodesWorkerProtocol) {
    self.output = output
    self.worker = worker
  }

  // MARK: Business logic
  func getAllData(filter: Episodes.Filter) {
    worker?.getAllData(filter: filter) { result in
      switch result {
      case .success(let response): self.output?.presentAllData(response)
      case .failure(let error): self.output?.present(error: error)
      }
    }
  }
}
