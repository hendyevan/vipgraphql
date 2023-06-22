
//  Created by Hendy Evan on 17/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Apollo

typealias CharactersResult = GraphQLResult<GetCharactersQuery.Data>

enum Characters {
  struct Model {
    let id: String
    let name: String
    let image: String
    var species: Species = .none
  }

  struct Filter {
    var page: Int = 1
    var name: String = ""
    var status: Status = .none
    var species: Species = .none
    var gender: Gender = .none
    var isFiltering: Bool {
      return !name.isEmpty || status != .none || species != .none || gender != .none
    }

    mutating func reset() {
      page = 1
      name = ""
      status = .none
      species = .none
      gender = .none
    }
  }

  enum Status: String, CaseIterable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
    case none = ""

    func getImage() -> UIImage? {
      var image = ""
      switch self {
      case .alive: image = "ic_status_alive"
      case .dead: image = "ic_status_dead"
      case .unknown: image = "ic_status_unknown"
      default: image = ""
      }

      return UIImage(named: image)
    }
  }

  enum Gender: String, CaseIterable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "Unknown"
    case none = ""

    func getImage() -> UIImage? {
      var image = ""
      switch self {
      case .male: image = "ic_gender_male"
      case .female: image = "ic_gender_female"
      case .genderless: image = "ic_gender_neutral"
      case .unknown: image = "ic_gender_unknown"
      default: image = ""
      }

      return UIImage(named: image)
    }
  }

  enum Species: String, CaseIterable {
    case alien = "Alien"
    case animal = "Animal"
    case myth = "Mythological Creature"
    case human = "Human"
    case unknown = "Unknown"
    case none = ""
  }

  struct FilterMenu {
    let section: FilterSection
    var items: [FilterItem]
  }

  struct FilterItem {
    let name: String
    var isSelected = false
  }

  enum FilterSection: String, CaseIterable {
    case species = "Species"
    case gender = "Gender"
    case status = "Status"
  }
}
