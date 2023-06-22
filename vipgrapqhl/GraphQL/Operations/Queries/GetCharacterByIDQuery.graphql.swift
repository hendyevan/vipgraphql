// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetCharacterByIDQuery: GraphQLQuery {
  public static let operationName: String = "GetCharacterByID"
  public static let document: Apollo.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetCharacterByID($id: ID!) {
        character(id: $id) {
          __typename
          id
          name
          image
          gender
          species
          status
          created
          type
          origin {
            __typename
            name
          }
          location {
            __typename
            name
          }
          episode {
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
      .field("character", Character?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific character by ID
    public var character: Character? { __data["character"] }

    /// Character
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
        .field("image", String?.self),
        .field("gender", String?.self),
        .field("species", String?.self),
        .field("status", String?.self),
        .field("created", String?.self),
        .field("type", String?.self),
        .field("origin", Origin?.self),
        .field("location", Location?.self),
        .field("episode", [Episode?].self),
      ] }

      /// The id of the character.
      public var id: Vipgraphql.ID? { __data["id"] }
      /// The name of the character.
      public var name: String? { __data["name"] }
      /// Link to the character's image.
      /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
      public var image: String? { __data["image"] }
      /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
      public var gender: String? { __data["gender"] }
      /// The species of the character.
      public var species: String? { __data["species"] }
      /// The status of the character ('Alive', 'Dead' or 'unknown').
      public var status: String? { __data["status"] }
      /// Time at which the character was created in the database.
      public var created: String? { __data["created"] }
      /// The type or subspecies of the character.
      public var type: String? { __data["type"] }
      /// The character's origin location
      public var origin: Origin? { __data["origin"] }
      /// The character's last known location
      public var location: Location? { __data["location"] }
      /// Episodes in which this character appeared.
      public var episode: [Episode?] { __data["episode"] }

      /// Character.Origin
      ///
      /// Parent Type: `Location`
      public struct Origin: Vipgraphql.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Location }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
        ] }

        /// The name of the location.
        public var name: String? { __data["name"] }
      }

      /// Character.Location
      ///
      /// Parent Type: `Location`
      public struct Location: Vipgraphql.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Location }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
        ] }

        /// The name of the location.
        public var name: String? { __data["name"] }
      }

      /// Character.Episode
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
        ] }

        /// The id of the episode.
        public var id: Vipgraphql.ID? { __data["id"] }
        /// The name of the episode.
        public var name: String? { __data["name"] }
      }
    }
  }
}
