// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetEpisodeByIDQuery: GraphQLQuery {
  public static let operationName: String = "GetEpisodeByID"
  public static let document: Apollo.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetEpisodeByID($id: ID!) {
        episode(id: $id) {
          __typename
          id
          name
          air_date
          episode
          created
          characters {
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
      .field("episode", Episode?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific episode by ID
    public var episode: Episode? { __data["episode"] }

    /// Episode
    ///
    /// Parent Type: `Episode`
    public struct Episode: Vipgraphql.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Episode }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("id", Vipgraphql.ID?.self),
        .field("name", String?.self),
        .field("air_date", String?.self),
        .field("episode", String?.self),
        .field("created", String?.self),
        .field("characters", [Character?].self),
      ] }

      /// The id of the episode.
      public var id: Vipgraphql.ID? { __data["id"] }
      /// The name of the episode.
      public var name: String? { __data["name"] }
      /// The air date of the episode.
      public var air_date: String? { __data["air_date"] }
      /// The code of the episode.
      public var episode: String? { __data["episode"] }
      /// Time at which the episode was created in the database.
      public var created: String? { __data["created"] }
      /// List of characters who have been seen in the episode.
      public var characters: [Character?] { __data["characters"] }

      /// Episode.Character
      ///
      /// Parent Type: `Character`
      public struct Character: Vipgraphql.SelectionSet {
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
