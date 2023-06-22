
//  Created by Hendy Evan on 17/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocol
protocol CharactersPresenterOutput: AnyObject {
  func displayAllData(_ data: [Characters.Model], maxPage: Int)
  func display(error: String)
}

// MARK: Class
final class CharactersPresenter: CharactersInteractorOutput {
  private weak var output: CharactersPresenterOutput?

  required init(output: CharactersPresenterOutput) {
    self.output = output
  }

  // MARK: Presentation logic
  func present(error: NSError) {
    output?.display(error: error.localizedDescription)
  }

  func presentAllData(_ response: CharactersResult?) {
    guard
      let result = response?.data?.characters?.results,
      let info = response?.data?.characters?.info
    else {
      self.output?.display(error: response?.errors?.first?.message ?? "")
      return
    }

    var data: [Characters.Model] = []
    result.forEach { char in
      data.append(Characters.Model(
        id: char?.id ?? "",
        name: char?.name ?? "",
        image: char?.image ?? "",
        species: Characters.Species(rawValue: char?.species ?? "") ?? .unknown
      ))
    }

    output?.displayAllData(data, maxPage: info.pages ?? 1)
  }
}
