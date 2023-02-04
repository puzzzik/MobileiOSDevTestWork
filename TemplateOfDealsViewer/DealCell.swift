import UIKit

class DealCell: UITableViewCell {
    static let reuseIidentifier = "DealCell"

    @IBOutlet var instrumentNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var sideLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    private enum Constants {
        static let instrumentPlaceholder = "Placeholder"
        static let pricePlaceholder = "0"
        static let amountPlaceholder = "0"
        static let sidePlaceholder = "side"
        static let datePlaceholder = "date"

        static let priceFormat = "%.02f "
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        instrumentNameLabel.text = Constants.instrumentPlaceholder
        priceLabel.text = Constants.pricePlaceholder
        amountLabel.text = Constants.amountPlaceholder
        sideLabel.text = Constants.sidePlaceholder
        dateLabel.text = Constants.datePlaceholder
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(deal: Deal) {
        instrumentNameLabel.text = deal.instrumentName
        priceLabel.text = String(format: Constants.priceFormat, deal.price)
        amountLabel.text = "\(Int(deal.amount))"
        sideLabel.text = deal.side.rawValue
        dateLabel.text = DateFormatter.timeDate.string(from: deal.dateModifier)
        switch deal.side {
        case .buy: sideLabel.textColor = .green
        case .sell: sideLabel.textColor = .red
        }
    }
}
