
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Apollo

typealias LocationsResult = GraphQLResult<GetLocationsQuery.Data>

enum Locations {
  struct Model {
    let id: String
    let name: String
    let type: String
    let dimension: String
  }

  struct Filter {
    var page: Int = 1
    var name: String = ""
    var type: String = ""
    var dimension: String = ""
    var isFiltering: Bool {
      return !name.isEmpty || !type.isEmpty || !dimension.isEmpty
    }

    mutating func reset() {
      page = 1
      name = ""
      type = ""
      dimension = ""
    }
  }
}
