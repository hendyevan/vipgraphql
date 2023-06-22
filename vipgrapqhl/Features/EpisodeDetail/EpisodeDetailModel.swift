
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Apollo

typealias EpisodeDetailResult = GraphQLResult<GetEpisodeByIDQuery.Data>

enum EpisodeDetail {
  struct Model {
    let id: String
    let name: String
    let airDate: String
    let episodeFull: String
    let episode: Int
    let season: Int
    let created: String
    let charactes: [Characters.Model]
  }
}
