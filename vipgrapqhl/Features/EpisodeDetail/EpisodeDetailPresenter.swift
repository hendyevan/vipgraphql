
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocol
protocol EpisodeDetailPresenterOutput: AnyObject {
  func displayEpisodeDetail(_ detail: EpisodeDetail.Model)
  func display(error: String)
}

// MARK: Class
final class EpisodeDetailPresenter: EpisodeDetailInteractorOutput {
  private weak var output: EpisodeDetailPresenterOutput?

  required init(output: EpisodeDetailPresenterOutput) {
    self.output = output
  }

  // MARK: Presentation logic
  func present(error: NSError) {
    output?.display(error: error.localizedDescription)
  }

  func presentEpisode(_ response: EpisodeDetailResult?) {
    guard let detail = response?.data?.episode else {
      self.output?.display(error: response?.errors?.first?.message ?? "")
      return
    }

    let airDate = (detail.air_date ?? "").toDate(format: "MMMM d, yyyy").toString(format: "d MMMM yyyy")
    let eps = (detail.episode ?? "").stringAfter("E")
    let session = (detail.episode ?? "").stringBefore("E").stringAfter("S")
    let created = (detail.created ?? "").toDate().toString(format: "HH:mm, dd MMMM yyyy")

    let episode = EpisodeDetail.Model(
      id: detail.id ?? "",
      name: detail.name ?? "",
      airDate: airDate,
      episodeFull: detail.episode ?? "",
      episode: Int(eps) ?? 0,
      season: Int(session) ?? 0,
      created: created,
      charactes: detail.characters.compactMap { item in
        return Characters.Model(id: item?.id ?? "", name: item?.name ?? "", image: "")
      }
    )

    output?.displayEpisodeDetail(episode)
  }
}
