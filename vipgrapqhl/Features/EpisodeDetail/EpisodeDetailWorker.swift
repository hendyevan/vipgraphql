
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol EpisodeDetailWorkerProtocol: AnyObject {
  func getEpisodeBy(id: String, callback: @escaping (APIResult<EpisodeDetailResult>) -> Void)
}

final class EpisodeDetailWorker: EpisodeDetailWorkerProtocol {
  func getEpisodeBy(id: String, callback: @escaping (APIResult<EpisodeDetailResult>) -> Void) {
    let query = GetEpisodeByIDQuery(id: id)

    NetworkClient.shared.client.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
      switch result {
      case .success(let response):
        callback(.success(response))
      case .failure(let error):
        callback(.failure(error as NSError))
      }
    }
  }
}
