
//  Created by Hendy Evan on 18/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Protocol
protocol LocationsPresenterOutput: AnyObject {
  func displayAllData(_ data: [Locations.Model], maxPage: Int)
  func display(error: String)
}

// MARK: Class
final class LocationsPresenter: LocationsInteractorOutput {
  private weak var output: LocationsPresenterOutput?

  required init(output: LocationsPresenterOutput) {
    self.output = output
  }

  // MARK: Presentation logic
  func present(error: NSError) {
    output?.display(error: error.localizedDescription)
  }

  func presentAllData(_ response: LocationsResult?) {
    guard
      let locations = response?.data?.locations?.results,
      let info = response?.data?.locations?.info
    else {
      self.output?.display(error: response?.errors?.first?.message ?? "")
      return
    }

    var data: [Locations.Model] = []
    locations.forEach { location in
      data.append(Locations.Model(
        id: location?.id ?? "",
        name: location?.name ?? "",
        type: location?.type ?? "",
        dimension: location?.dimension ?? ""
      ))
    }

    output?.displayAllData(data, maxPage: info.pages ?? 1)
  }
}
