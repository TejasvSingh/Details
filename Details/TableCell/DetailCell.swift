import UIKit

class TranscodingCell: UITableViewCell {
    static let reuseID = "TranscodingCell"

    private let infoLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    private func configure() {
        infoLabel.numberOfLines = 0
        infoLabel.font = .systemFont(ofSize: 15)
        contentView.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }

    func configure(with t: transcodings) {
        infoLabel.text = """
        id: \(t.id ?? "-")
        title: \(t.title ?? "-")
        height: \(t.height.map(String.init) ?? "-")
        """
    }
}

