
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocols
protocol EpisodeDetailInteractorInput: AnyObject {
  func getEpisodeBy(id: String)
}

protocol EpisodeDetailInteractorOutput: AnyObject {
  func presentEpisode(_ response: EpisodeDetailResult?)
  func present(error: NSError)
}

// MARK: Class
final class EpisodeDetailInteractor: EpisodeDetailInteractorInput {
  private var output: EpisodeDetailInteractorOutput?
  private var worker: EpisodeDetailWorkerProtocol?

  required init(output: EpisodeDetailInteractorOutput, worker: EpisodeDetailWorkerProtocol) {
    self.output = output
    self.worker = worker
  }

  // MARK: Business logic
  func getEpisodeBy(id: String) {
    worker?.getEpisodeBy(id: id) { result in
      switch result {
      case .success(let response): self.output?.presentEpisode(response)
      case .failure(let error): self.output?.present(error: error)
      }
    }
  }
}
