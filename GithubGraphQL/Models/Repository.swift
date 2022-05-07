struct Repository: Decodable {
    let name: String
    let path: String
    let owner: String
    let avatar: String
    let stars: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case path = "Path"
        case owner = "Owner"
        case avatar
        case stars = "Stars"
    }
}
