
import Foundation
import Apollo

// An interceptor for network client
// you can set custom or default interceptor to use
struct NetworkInterceptorProvider: InterceptorProvider {
  // These properties will remain the same throughout the life of the `InterceptorProvider`, even though they
  // will be handed to different interceptors.
  private let store: ApolloStore
  private let client: URLSessionClient

  init(
    store: ApolloStore,
    client: URLSessionClient
  ) {
    self.store = store
    self.client = client
  }

  func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
    return [
      MaxRetryInterceptor(),
      NetworkFetchInterceptor(client: self.client),
      ResponseCodeInterceptor(),
      JSONResponseParsingInterceptor(),
      AutomaticPersistedQueryInterceptor(),
      CacheWriteInterceptor(store: self.store)
    ]
  }
}
