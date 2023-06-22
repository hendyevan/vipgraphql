
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CharacterDetailWorkerProtocol: AnyObject {
  func getCharacterBy(id: String, callback: @escaping (APIResult<CharacterDetailResult>) -> Void)
}

final class CharacterDetailWorker: CharacterDetailWorkerProtocol {
  func getCharacterBy(id: String, callback: @escaping (APIResult<CharacterDetailResult>) -> Void) {
    let query = GetCharacterByIDQuery(id: id)

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
