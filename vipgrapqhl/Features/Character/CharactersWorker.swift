
//  Created by Hendy Evan on 17/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CharactersWorkerProtocol: AnyObject {
  func getAllData(filter: Characters.Filter, callback: @escaping (APIResult<CharactersResult>) -> Void)
}

final class CharactersWorker: CharactersWorkerProtocol {
  func getAllData(filter: Characters.Filter, callback: @escaping (APIResult<CharactersResult>) -> Void) {
    let query = GetCharactersQuery(
      page: filter.page,
      name: .init(stringLiteral: filter.name),
      gender: .init(stringLiteral: filter.gender.rawValue),
      species: .init(stringLiteral: filter.species.rawValue),
      type: nil,
      status: .init(stringLiteral: filter.status.rawValue)
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
