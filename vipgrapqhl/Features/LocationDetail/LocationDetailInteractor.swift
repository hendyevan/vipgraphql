
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocols
protocol LocationDetailInteractorInput: AnyObject {
  func getLocationBy(id: String)
}

protocol LocationDetailInteractorOutput: AnyObject {
  func presentLocation(_ response: LocationDetailResult?)
  func present(error: NSError)
}

// MARK: Class
final class LocationDetailInteractor: LocationDetailInteractorInput {
  private var output: LocationDetailInteractorOutput?
  private var worker: LocationDetailWorkerProtocol?

  required init(output: LocationDetailInteractorOutput, worker: LocationDetailWorkerProtocol) {
    self.output = output
    self.worker = worker
  }

  // MARK: Business logic
  func getLocationBy(id: String) {
    worker?.getLocationBy(id: id) { result in
      switch result {
      case .success(let response): self.output?.presentLocation(response)
      case .failure(let error): self.output?.present(error: error)
      }
    }
  }
}
