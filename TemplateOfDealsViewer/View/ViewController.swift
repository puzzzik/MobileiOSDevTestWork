import UIKit
import SnapKit

// MARK: - ViewController

final class ViewController: UIViewController {
    var output: ViewControllerOutput!
    private var tableView = UITableView(frame: .zero)

    private enum Constants {
        static let title: String = "Deals"
        static let numberOfSections: Int = 1
        static let headerHeight: CGFloat = 100
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        output.viewDidLoad()
    }

    private func setupViews() {
        navigationItem.title = Constants.title
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(UINib(nibName: DealCell.reuseIidentifier, bundle: nil), forCellReuseIdentifier: DealCell.reuseIidentifier)
        tableView.register(UINib(nibName: HeaderCell.reuseIidentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: HeaderCell.reuseIidentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.dealsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DealCell.reuseIidentifier, for: indexPath) as! DealCell
        cell.configure(deal: output.dealForIndexPath(indexPath: indexPath))
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderCell.reuseIidentifier) as! HeaderCell
        cell.delegate = self
        cell.configure(sort: output.headerSort)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.headerHeight
    }
}

// MARK: ViewControllerInput

extension ViewController: ViewControllerInput {
    func reload() {
        tableView.reloadData()
    }
}

// MARK: HeaderDelegate

extension ViewController: HeaderDelegate {
    func sortDidChange(sort: Sort) {
        output.sortDidChange(sort: sort)
    }
}
