// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetCharactersQuery: GraphQLQuery {
  public static let operationName: String = "GetCharacters"
  public static let document: Apollo.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetCharacters($page: Int!, $name: String, $gender: String, $species: String, $type: String, $status: String) {
        characters(
          page: $page
          filter: {name: $name, gender: $gender, species: $species, type: $type, status: $status}
        ) {
          __typename
          info {
            __typename
            pages
            next
            prev
          }
          results {
            __typename
            id
            name
            image
            species
          }
        }
      }
      """#
    ))

  public var page: Int
  public var name: GraphQLNullable<String>
  public var gender: GraphQLNullable<String>
  public var species: GraphQLNullable<String>
  public var type: GraphQLNullable<String>
  public var status: GraphQLNullable<String>

  public init(
    page: Int,
    name: GraphQLNullable<String>,
    gender: GraphQLNullable<String>,
    species: GraphQLNullable<String>,
    type: GraphQLNullable<String>,
    status: GraphQLNullable<String>
  ) {
    self.page = page
    self.name = name
    self.gender = gender
    self.species = species
    self.type = type
    self.status = status
  }

  public var __variables: Variables? { [
    "page": page,
    "name": name,
    "gender": gender,
    "species": species,
    "type": type,
    "status": status
  ] }

  public struct Data: Vipgraphql.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("characters", Characters?.self, arguments: [
        "page": .variable("page"),
        "filter": [
          "name": .variable("name"),
          "gender": .variable("gender"),
          "species": .variable("species"),
          "type": .variable("type"),
          "status": .variable("status")
        ]
      ]),
    ] }

    /// Get the list of all characters
    public var characters: Characters? { __data["characters"] }

    /// Characters
    ///
    /// Parent Type: `Characters`
    public struct Characters: Vipgraphql.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Characters }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("info", Info?.self),
        .field("results", [Result?]?.self),
      ] }

      public var info: Info? { __data["info"] }
      public var results: [Result?]? { __data["results"] }

      /// Characters.Info
      ///
      /// Parent Type: `Info`
      public struct Info: Vipgraphql.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Info }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("pages", Int?.self),
          .field("next", Int?.self),
          .field("prev", Int?.self),
        ] }

        /// The amount of pages.
        public var pages: Int? { __data["pages"] }
        /// Number of the next page (if it exists)
        public var next: Int? { __data["next"] }
        /// Number of the previous page (if it exists)
        public var prev: Int? { __data["prev"] }
      }

      /// Characters.Result
      ///
      /// Parent Type: `Character`
      public struct Result: Vipgraphql.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Character }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Vipgraphql.ID?.self),
          .field("name", String?.self),
          .field("image", String?.self),
          .field("species", String?.self),
        ] }

        /// The id of the character.
        public var id: Vipgraphql.ID? { __data["id"] }
        /// The name of the character.
        public var name: String? { __data["name"] }
        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? { __data["image"] }
        /// The species of the character.
        public var species: String? { __data["species"] }
      }
    }
  }
}
