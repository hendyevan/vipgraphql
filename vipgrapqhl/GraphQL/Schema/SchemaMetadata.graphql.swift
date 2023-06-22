// @generated
// This file was automatically generated and should not be edited.

import Apollo

public typealias ID = String

public protocol Vipgraphql_SelectionSet: Apollo.SelectionSet & Apollo.RootSelectionSet
where Schema == Vipgraphql.SchemaMetadata {}

public protocol Vipgraphql_InlineFragment: Apollo.SelectionSet & Apollo.InlineFragment
where Schema == Vipgraphql.SchemaMetadata {}

public protocol Vipgraphql_MutableSelectionSet: Apollo.MutableRootSelectionSet
where Schema == Vipgraphql.SchemaMetadata {}

public protocol Vipgraphql_MutableInlineFragment: Apollo.MutableSelectionSet & Apollo.InlineFragment
where Schema == Vipgraphql.SchemaMetadata {}

public extension Vipgraphql {
  typealias ID = String
  
  typealias SelectionSet = Vipgraphql_SelectionSet

  typealias InlineFragment = Vipgraphql_InlineFragment

  typealias MutableSelectionSet = Vipgraphql_MutableSelectionSet

  typealias MutableInlineFragment = Vipgraphql_MutableInlineFragment

  enum SchemaMetadata: Apollo.SchemaMetadata {
    public static let configuration: Apollo.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return Vipgraphql.Objects.Query
      case "Locations": return Vipgraphql.Objects.Locations
      case "Info": return Vipgraphql.Objects.Info
      case "Location": return Vipgraphql.Objects.Location
      case "Character": return Vipgraphql.Objects.Character
      case "Episode": return Vipgraphql.Objects.Episode
      case "Episodes": return Vipgraphql.Objects.Episodes
      case "Characters": return Vipgraphql.Objects.Characters
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}
