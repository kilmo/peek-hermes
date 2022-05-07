struct PageInfo: Decodable {
    let pageInfo: String
    let hasNextPage: Bool
    let hasPreviousPage: Bool
    let startCursor: String?
    let endCursor: String?
}
