
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol LocationsWorkerProtocol: AnyObject {
  func getAllData(filter: Locations.Filter, callback: @escaping (APIResult<LocationsResult>) -> Void)
}

final class LocationsWorker: LocationsWorkerProtocol {
  func getAllData(filter: Locations.Filter, callback: @escaping (APIResult<LocationsResult>) -> Void) {
    let query = GetLocationsQuery(
      page: filter.page,
      name: .init(stringLiteral: filter.name),
      type: .init(stringLiteral: filter.type),
      dimension: .init(stringLiteral: filter.dimension)
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
