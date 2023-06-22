

import Foundation

extension Date {
  /// Convert `String` date time to `Date`
  /// using custom format
  func toString(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = format
    return formatter.string(from: self)
  }
}
