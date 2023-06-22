
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol LocationDetailWorkerProtocol: AnyObject {
  func getLocationBy(id: String, callback: @escaping (APIResult<LocationDetailResult>) -> Void)
}

final class LocationDetailWorker: LocationDetailWorkerProtocol {
  func getLocationBy(id: String, callback: @escaping (APIResult<LocationDetailResult>) -> Void) {
    let query = GetLocationByIDQuery(id: id)

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
