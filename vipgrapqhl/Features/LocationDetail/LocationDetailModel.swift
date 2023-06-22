
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Apollo

typealias LocationDetailResult = GraphQLResult<GetLocationByIDQuery.Data>

enum LocationDetail {
  struct Model {
    let id: String
    let name: String
    let type: String
    let dimension: String
    let created: String
    let residents: [Characters.Model]
  }
}
