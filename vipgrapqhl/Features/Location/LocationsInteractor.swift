
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocols
protocol LocationsInteractorInput: AnyObject {
  func getAllData(filter: Locations.Filter)
}

protocol LocationsInteractorOutput: AnyObject {
  func presentAllData(_ response: LocationsResult?)
  func present(error: NSError)
}

// MARK: Class
final class LocationsInteractor: LocationsInteractorInput {
  private var output: LocationsInteractorOutput?
  private var worker: LocationsWorkerProtocol?

  required init(output: LocationsInteractorOutput, worker: LocationsWorkerProtocol) {
    self.output = output
    self.worker = worker
  }

  // MARK: Business logic
  func getAllData(filter: Locations.Filter) {
    worker?.getAllData(filter: filter) { result in
      switch result {
      case .success(let response): self.output?.presentAllData(response)
      case .failure(let error): self.output?.present(error: error)
      }
    }
  }
}
