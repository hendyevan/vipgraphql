// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetLocationsQuery: GraphQLQuery {
  public static let operationName: String = "GetLocations"
  public static let document: Apollo.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetLocations($page: Int!, $name: String, $type: String, $dimension: String) {
        locations(
          page: $page
          filter: {name: $name, type: $type, dimension: $dimension}
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
            type
            dimension
          }
        }
      }
      """#
    ))

  public var page: Int
  public var name: GraphQLNullable<String>
  public var type: GraphQLNullable<String>
  public var dimension: GraphQLNullable<String>

  public init(
    page: Int,
    name: GraphQLNullable<String>,
    type: GraphQLNullable<String>,
    dimension: GraphQLNullable<String>
  ) {
    self.page = page
    self.name = name
    self.type = type
    self.dimension = dimension
  }

  public var __variables: Variables? { [
    "page": page,
    "name": name,
    "type": type,
    "dimension": dimension
  ] }

  public struct Data: Vipgraphql.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("locations", Locations?.self, arguments: [
        "page": .variable("page"),
        "filter": [
          "name": .variable("name"),
          "type": .variable("type"),
          "dimension": .variable("dimension")
        ]
      ]),
    ] }

    /// Get the list of all locations
    public var locations: Locations? { __data["locations"] }

    /// Locations
    ///
    /// Parent Type: `Locations`
    public struct Locations: Vipgraphql.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Locations }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("info", Info?.self),
        .field("results", [Result?]?.self),
      ] }

      public var info: Info? { __data["info"] }
      public var results: [Result?]? { __data["results"] }

      /// Locations.Info
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

      /// Locations.Result
      ///
      /// Parent Type: `Location`
      public struct Result: Vipgraphql.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { Vipgraphql.Objects.Location }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Vipgraphql.ID?.self),
          .field("name", String?.self),
          .field("type", String?.self),
          .field("dimension", String?.self),
        ] }

        /// The id of the location.
        public var id: Vipgraphql.ID? { __data["id"] }
        /// The name of the location.
        public var name: String? { __data["name"] }
        /// The type of the location.
        public var type: String? { __data["type"] }
        /// The dimension in which the location is located.
        public var dimension: String? { __data["dimension"] }
      }
    }
  }
}
