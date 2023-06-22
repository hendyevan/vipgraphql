// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetLocationByIDQuery: GraphQLQuery {
  public static let operationName: String = "GetLocationByID"
  public static let document: Apollo.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetLocationByID($id: ID!) {
        location(id: $id) {
          __typename
          id
          name
          type
          dimension
          created
          residents {
            __typename
            id
            name
          }
        }
      }
      """#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: Vipgraphql.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("location", Location?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific locations by ID
    public var location: Location? { __data["location"] }

    /// Location
    ///
    /// Parent Type: `Location`
    public struct Location: Vipgraphql.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Location }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("id", Vipgraphql.ID?.self),
        .field("name", String?.self),
        .field("type", String?.self),
        .field("dimension", String?.self),
        .field("created", String?.self),
        .field("residents", [Resident?].self),
      ] }

      /// The id of the location.
      public var id: Vipgraphql.ID? { __data["id"] }
      /// The name of the location.
      public var name: String? { __data["name"] }
      /// The type of the location.
      public var type: String? { __data["type"] }
      /// The dimension in which the location is located.
      public var dimension: String? { __data["dimension"] }
      /// Time at which the location was created in the database.
      public var created: String? { __data["created"] }
      /// List of characters who have been last seen in the location.
      public var residents: [Resident?] { __data["residents"] }

      /// Location.Resident
      ///
      /// Parent Type: `Character`
      public struct Resident: Vipgraphql.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Character }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Vipgraphql.ID?.self),
          .field("name", String?.self),
        ] }

        /// The id of the character.
        public var id: Vipgraphql.ID? { __data["id"] }
        /// The name of the character.
        public var name: String? { __data["name"] }
      }
    }
  }
}
