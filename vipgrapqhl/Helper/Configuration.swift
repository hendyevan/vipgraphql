//
//  Configuration.swift
//  hello world
//
//  Created by Hendy Evan on 22/06/23.
//

import Foundation

/// Enumeration for mapping in `Info.plist` custom key
enum ConfigKey: String {
  case baseURL
}

/// Helper to get value from custom key in `Info.plist`
enum Configuration {
  private static var infoDict: [String: Any] {
    guard let dict = Bundle.main.infoDictionary else { fatalError("Plist file not found") }
    return dict
  }
  
  /// Function to get value from custom key in `Info.plist`
  static func value(_ key: ConfigKey) -> String {
    return Configuration.infoDict[key.rawValue] as? String ?? ""
  }
}
