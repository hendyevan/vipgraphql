

import Apollo

enum APIResult<GraphQLResult> {
  case success(GraphQLResult)
  case failure(NSError)
}

// A network client for connecting with GraphQL
final class NetworkClient {
  static let shared = NetworkClient()

  // swiftlint:disable force_unwrapping
  private var url: URL {
    return URL(string: "https://rickandmortyapi.com/graphql")!
  }

  // Configure client
  private(set) lazy var client: ApolloClient = {
    let cache = InMemoryNormalizedCache()
    let store = ApolloStore(cache: cache)

    let client = URLSessionClient()
    let provider = NetworkInterceptorProvider(store: store, client: client)

    let requestChainTransport = RequestChainNetworkTransport(
      interceptorProvider: provider,
      endpointURL: url
    )

    return ApolloClient(
      networkTransport: requestChainTransport,
      store: store
    )
  }()
}
