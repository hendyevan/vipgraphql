
import Foundation

extension String {
  /// Convert date time value from `String` to `Date`
  /// using custom format
  func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format

    guard let date = dateFormatter.date(from: self) else { return Date()}
    return date
  }

  /// Get string before specific character,
  /// return default value if specific character not found
  func stringBefore(_ delimiter: Character, defaultValue: String = "") -> String {
    if let index = firstIndex(of: delimiter) {
      return String(prefix(upTo: index))
    }
    return defaultValue.isEmpty ? self : defaultValue
  }

  /// Get string after specific character,
  /// return default value if specific character not found
  func stringAfter(_ delimiter: Character) -> String {
    if let index = firstIndex(of: delimiter) {
      return String(suffix(from: index).dropFirst())
    }
    return ""
  }

  /// Calculate width from string using `UILabel`
  func getTextWidth(height: CGFloat, margin: CGFloat, font: UIFont, line: Int = 1) -> CGFloat {
    guard !self.isEmpty else {
      return 0.0
    }

    let label: UILabel = {
      let lbl = UILabel()
      lbl.frame = CGRect(x: 0.0, y: 0.0, width: .greatestFiniteMagnitude, height: height)
      lbl.font = font
      lbl.textAlignment = .left
      lbl.numberOfLines = line
      lbl.lineBreakMode = .byWordWrapping
      lbl.text = self
      lbl.sizeToFit()
      return lbl
    }()

    return label.frame.width + margin
  }
}
