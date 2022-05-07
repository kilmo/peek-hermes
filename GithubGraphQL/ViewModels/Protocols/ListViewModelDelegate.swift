protocol ListViewModelDelegate: AnyObject {
    func listViewModel(_ listViewModel: ListViewModel,
                       didCompleteSearchFor pageInfo: PageInformation,
                       with repositories: [Repository])
    func listViewModel(_ listViewModel: ListViewModel,
                       didFailWithError Error: Error)
}
