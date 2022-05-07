import Apollo

final class ListViewModel: SearchRepository {
    private let client: GraphQLClient
    weak var delegate: ListViewModelDelegate?
    
    init(client: GraphQLClient = ApolloClient.shared) {
        self.client = client
    }
    
    func search(phrase: String) {
        /*
         example search of a given phrase, using default searching parameters
         */
        
        self.client.searchRepositories(mentioning: phrase) { response in
            switch response {
            case let .failure(error):
                self.delegate?.listViewModel(self, didFailWithError: error)
                
            case let .success(results):
                let pageInfo = adapterPageInfo(results.pageInfo)
                let repositories = adapterRepositories(repositories: results.repos)
                self.delegate?.listViewModel(self, didCompleteSearchFor: pageInfo, with: repositories)
            }
        }
    }
    
    private func adapterPageInfo(pageInfo: PageInfo) -> PageInformation {
        return PageInformation(hasNextPage: pageInfo.hasNextPage, hasPreviousPage: pageInfo.hasPreviousPage, startCursor: String(describing: pageInfo.startCursor), endCursor: String(describing: pageInfo.endCursor))
    }
    
    private func adapterRepositories(repositories: [RepositoryDetails]) -> [Repository] {
        let repos = repositories.repos.map { repository in
            return Repository(name: repository.name, path: repository.url, owner: repository.owner.login, avatar: repository.owner.avatarUrl, stars: repository.stargazers.totalCount)
        }
        return repos
    }
}
