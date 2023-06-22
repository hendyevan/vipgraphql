
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocol
protocol CharacterDetailPresenterOutput: AnyObject {
  func displayCharacterDetail(_ detail: CharacterDetail.Model)
  func display(error: String)
}

// MARK: Class
final class CharacterDetailPresenter: CharacterDetailInteractorOutput {
  private weak var output: CharacterDetailPresenterOutput?

  required init(output: CharacterDetailPresenterOutput) {
    self.output = output
  }

  // MARK: Presentation logic
  func present(error: NSError) {
    output?.display(error: error.localizedDescription)
  }

  func presentCharacter(_ response: CharacterDetailResult?) {
    guard let detail = response?.data?.character else {
      self.output?.display(error: response?.errors?.first?.message ?? "")
      return
    }

    let created = (detail.created ?? "").toDate().toString(format: "HH:mm, MMMM yyyy")

    let character = CharacterDetail.Model(
      id: detail.id ?? "",
      name: detail.name ?? "",
      image: detail.image ?? "",
      status: Characters.Status(rawValue: detail.status ?? "") ?? .unknown,
      gender: Characters.Gender(rawValue: detail.gender ?? "") ?? .unknown,
      species: Characters.Species(rawValue: detail.species ?? "") ?? .unknown,
      createdAt: created,
      origin: detail.origin?.name ?? "",
      location: detail.location?.name ?? "",
      episodes: detail.episode.compactMap { item in
        return item?.name ?? ""
      }
    )

    output?.displayCharacterDetail(character)
  }
}
