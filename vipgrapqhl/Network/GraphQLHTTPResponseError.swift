
import Foundation
import Apollo

/// A transport-level, HTTP-specific error.
struct GraphQLResponseError: Error, LocalizedError {
  /// The body of the response.
  public let body: Data?
  private let serializationFormat = JSONSerializationFormat.self

  public init(body: Data? = nil) {
    self.body = body
  }

  /// Any graphQL errors that could be parsed from the response, or nil if none could be parsed.
  public var graphQLErrors: [GraphQLError]? {
    guard
      let data = self.body,
      let json = try? self.serializationFormat.deserialize(data: data) as? JSONObject,
      let errorArray = json["errors"] as? [JSONObject] else {
      return nil
    }

    let parsedErrors = errorArray.compactMap { GraphQLError($0) }
    return parsedErrors
  }

  public var bodyDescription: String {
    guard let body = body else {
      return "[Empty response body]"
    }

    guard let description = String(data: body, encoding: .utf8) else {
      return "[Unreadable response body]"
    }

    return description
  }
}
