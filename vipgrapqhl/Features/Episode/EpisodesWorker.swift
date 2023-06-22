
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol EpisodesWorkerProtocol: AnyObject {
  func getAllData(filter: Episodes.Filter, callback: @escaping (APIResult<EpisodesResult>) -> Void)
}

final class EpisodesWorker: EpisodesWorkerProtocol {
  func getAllData(filter: Episodes.Filter, callback: @escaping (APIResult<EpisodesResult>) -> Void) {
    let query = GetEpisodeQuery(
      page: filter.page,
      name: .init(stringLiteral: filter.name),
      episode: .init(stringLiteral: filter.episode)
    )

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
