protocol SearchRepository {
    var delegate: ListViewModelDelegate? { get set }
    func search(phrase: String)
}
