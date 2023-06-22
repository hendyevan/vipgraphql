// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetEpisodeQuery: GraphQLQuery {
  public static let operationName: String = "GetEpisode"
  public static let document: Apollo.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetEpisode($page: Int!, $name: String, $episode: String) {
        episodes(page: $page, filter: {name: $name, episode: $episode}) {
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
            air_date
            episode
          }
        }
      }
      """#
    ))

  public var page: Int
  public var name: GraphQLNullable<String>
  public var episode: GraphQLNullable<String>

  public init(
    page: Int,
    name: GraphQLNullable<String>,
    episode: GraphQLNullable<String>
  ) {
    self.page = page
    self.name = name
    self.episode = episode
  }

  public var __variables: Variables? { [
    "page": page,
    "name": name,
    "episode": episode
  ] }

  public struct Data: Vipgraphql.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("episodes", Episodes?.self, arguments: [
        "page": .variable("page"),
        "filter": [
          "name": .variable("name"),
          "episode": .variable("episode")
        ]
      ]),
    ] }

    /// Get the list of all episodes
    public var episodes: Episodes? { __data["episodes"] }

    /// Episodes
    ///
    /// Parent Type: `Episodes`
    public struct Episodes: Vipgraphql.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Episodes }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("info", Info?.self),
        .field("results", [Result?]?.self),
      ] }

      public var info: Info? { __data["info"] }
      public var results: [Result?]? { __data["results"] }

      /// Episodes.Info
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

      /// Episodes.Result
      ///
      /// Parent Type: `Episode`
      public struct Result: Vipgraphql.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Episode }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Vipgraphql.ID?.self),
          .field("name", String?.self),
          .field("air_date", String?.self),
          .field("episode", String?.self),
        ] }

        /// The id of the episode.
        public var id: Vipgraphql.ID? { __data["id"] }
        /// The name of the episode.
        public var name: String? { __data["name"] }
        /// The air date of the episode.
        public var air_date: String? { __data["air_date"] }
        /// The code of the episode.
        public var episode: String? { __data["episode"] }
      }
    }
  }
}
