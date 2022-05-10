import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var repositoryList: UITableView!
    
    let searchRepositories: SearchRepository
    
    init(searchRepositories: SearchRepository) {
        self.searchRepositories = searchRepositories
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupTableView() {
        repositoryList.delegate = self
        repositoryList.dataSource = self
        searchRepositories.search(phrase: "graphql")
    }
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repositoryList.dequeueReusableCell(withIdentifier: "repositoryCell", for: indexPath)
        return cell
    }
    
}


extension ListViewController: UITableViewDelegate {
    
}
