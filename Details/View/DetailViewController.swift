import UIKit
class TranscodingsViewController: UIViewController {
    private let tableView = UITableView()
    private var items: [transcodings] = []
    var networkManager = NetworkManager.shared
    var heading : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground


        tableView.dataSource = self
        tableView.register(TranscodingCell.self, forCellReuseIdentifier: TranscodingCell.reuseID)
        view.addSubview(tableView)
        tableView.frame = view.bounds
        getDataFromServer { [weak self] in
            DispatchQueue.main.async {
                self?.title = self?.heading
                self?.tableView.reloadData()
            }
        }
      
    }

    func getDataFromServer(closure: @escaping () -> Void) {
        networkManager.getData(from: Server.detailEndPoint) { [weak self] result in
            guard let self = self else { return }
            let fetched = self.networkManager.parse(data: result)
            self.heading = fetched?.title
            self.items = fetched?.arr ?? []
            closure()
        }
    }
}

extension TranscodingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TranscodingCell.reuseID,
            for: indexPath
        ) as! TranscodingCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
}

