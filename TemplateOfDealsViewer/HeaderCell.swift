import UIKit

// MARK: - HeaderDelegate

protocol HeaderDelegate: AnyObject {
    func sortDidChange(sort: Sort)
}

// MARK: - HeaderCell

class HeaderCell: UITableViewHeaderFooterView {
    static let reuseIidentifier = "HeaderCell"

    @IBOutlet var instrumentNameTitlLabel: UILabel!
    @IBOutlet var priceTitleLabel: UILabel!
    @IBOutlet var amountTitleLabel: UILabel!
    @IBOutlet var sideTitleLabel: UILabel!
    @IBOutlet var directionButton: UIButton!
    @IBOutlet var fieldButton: UIButton!

    weak var delegate: HeaderDelegate?

    private enum Constants {
        static let directionMenuTitle = "Direction"
        static let fieldMenuTitle = "Field"
    }

    func configure(sort: Sort) {
        setupFieldMenu(sort)
        setupDirectionMenu(sort)
    }

    private func setupDirectionMenu(_ sort: Sort) {
        let directionDownAction = UIAction(title: Sort.Direction.down.rawValue) { [weak self] action in
            var newSort = sort
            newSort.direction = .down
            self?.delegate?.sortDidChange(sort: newSort)
        }
        let directionUpAction = UIAction(title: Sort.Direction.up.rawValue) { [weak self] action in
            var newSort = sort
            newSort.direction = .up
            self?.delegate?.sortDidChange(sort: newSort)
        }
        let directionMenu = UIMenu(title: Constants.directionMenuTitle,
                                   options: .displayInline,
                                   children: [directionDownAction, directionUpAction])
        directionButton.menu = directionMenu
        directionButton.showsMenuAsPrimaryAction = true
        directionButton.setTitle(sort.direction.rawValue, for: .normal)
    }

    private func setupFieldMenu(_ sort: Sort) {
        let fieldDateAction = UIAction(title: Sort.Field.date.rawValue) { [weak self] action in
            var newSort = sort
            newSort.field = .date
            self?.delegate?.sortDidChange(sort: newSort)
        }
        let fieldInstrumentAction = UIAction(title: Sort.Field.instrument.rawValue) { [weak self] action in
            var newSort = sort
            newSort.field = .instrument
            self?.delegate?.sortDidChange(sort: newSort)
        }
        let fieldPriceAction = UIAction(title: Sort.Field.price.rawValue) { [weak self] action in
            var newSort = sort
            newSort.field = .price
            self?.delegate?.sortDidChange(sort: newSort)
        }
        let fieldAmountAction = UIAction(title: Sort.Field.amount.rawValue) { [weak self] action in
            var newSort = sort
            newSort.field = .amount
            self?.delegate?.sortDidChange(sort: newSort)
        }
        let fieldSideAction = UIAction(title: Sort.Field.side.rawValue) { [weak self] action in
            var newSort = sort
            newSort.field = .side
            self?.delegate?.sortDidChange(sort: newSort)
        }
        let fieldMenu = UIMenu(title: Constants.fieldMenuTitle,
                               options: .displayInline,
                               children: [fieldDateAction, fieldInstrumentAction,
                                          fieldPriceAction, fieldAmountAction, fieldSideAction])
        fieldButton.menu = fieldMenu
        fieldButton.showsMenuAsPrimaryAction = true
        fieldButton.setTitle(sort.field.rawValue, for: .normal)
    }
}
