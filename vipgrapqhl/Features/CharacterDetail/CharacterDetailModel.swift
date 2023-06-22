
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Apollo

typealias CharacterDetailResult = GraphQLResult<GetCharacterByIDQuery.Data>

enum CharacterDetail {
  struct Model {
    let id: String
    let name: String
    let image: String
    var status: Characters.Status = .none
    var gender: Characters.Gender = .none
    var species: Characters.Species = .none
    var createdAt: String = ""
    var origin: String = ""
    var location: String = ""
    var episodes: [String] = []
  }
}
