
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocol
protocol EpisodesPresenterOutput: AnyObject {
  func displayAllData(_ data: [Episodes.Model], maxPage: Int)
  func display(error: String)
}

// MARK: Class
final class EpisodesPresenter: EpisodesInteractorOutput {
  private weak var output: EpisodesPresenterOutput?

  required init(output: EpisodesPresenterOutput) {
    self.output = output
  }

  // MARK: Presentation logic
  func present(error: NSError) {
    output?.display(error: error.localizedDescription)
  }

  func presentAllData(_ response: EpisodesResult?) {
    guard
      let episodes = response?.data?.episodes?.results,
      let info = response?.data?.episodes?.info
    else {
      self.output?.display(error: response?.errors?.first?.message ?? "")
      return
    }

    var data: [Episodes.Model] = []
    episodes.forEach { episode in
      let airDate = (episode?.air_date ?? "").toDate(format: "MMMM d, yyyy").toString(format: "d MMMM yyyy")
      let eps = (episode?.episode ?? "").stringAfter("E")
      let session = (episode?.episode ?? "").stringBefore("E").stringAfter("S")

      data.append(Episodes.Model(
        id: episode?.id ?? "",
        name: episode?.name ?? "",
        airDate: airDate,
        episodeFull: episode?.episode ?? "",
        episode: Int(eps) ?? 0,
        season: Int(session) ?? 0
      ))
    }

    output?.displayAllData(data, maxPage: info.pages ?? 1)
  }
}
