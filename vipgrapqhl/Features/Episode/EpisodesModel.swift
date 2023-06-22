
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Apollo

typealias EpisodesResult = GraphQLResult<GetEpisodeQuery.Data>

enum Episodes {
  struct Model {
    let id: String
    let name: String
    let airDate: String
    let episodeFull: String
    let episode: Int
    let season: Int
  }

  struct Filter {
    var page: Int = 1
    var name: String = ""
    var episode: String = ""
    var isFiltering: Bool {
      return !name.isEmpty || !episode.isEmpty
    }

    mutating func reset() {
      page = 1
      name = ""
      episode = ""
    }
  }
}
