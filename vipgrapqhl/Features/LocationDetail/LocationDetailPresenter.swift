
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocol
protocol LocationDetailPresenterOutput: AnyObject {
  func displayLocationDetail(_ detail: LocationDetail.Model)
  func display(error: String)
}

// MARK: Class
final class LocationDetailPresenter: LocationDetailInteractorOutput {
  private weak var output: LocationDetailPresenterOutput?

  required init(output: LocationDetailPresenterOutput) {
    self.output = output
  }

  // MARK: Presentation logic
  func present(error: NSError) {
    output?.display(error: error.localizedDescription)
  }

  func presentLocation(_ response: LocationDetailResult?) {
    guard let detail = response?.data?.location else {
      self.output?.display(error: response?.errors?.first?.message ?? "")
      return
    }

    let created = (detail.created ?? "").toDate().toString(format: "HH:mm, dd MMMM yyyy")

    let location = LocationDetail.Model(
      id: detail.id ?? "",
      name: detail.name ?? "",
      type: detail.type ?? "",
      dimension: detail.dimension ?? "",
      created: created,
      residents: detail.residents.compactMap { item in
        return Characters.Model(id: item?.id ?? "", name: item?.name ?? "", image: "")
      }
    )

    output?.displayLocationDetail(location)
  }
}
