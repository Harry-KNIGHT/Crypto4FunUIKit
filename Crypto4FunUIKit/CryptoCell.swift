//
//  CryptoCell.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 17/09/2022.
//

import UIKit
import Crypto4FunKit

class CryptoCell: UITableViewCell {

	@IBOutlet weak var cryptoImageView: UIImageView!
	@IBOutlet weak var cryptoNameLabel: UILabel!
	
	@IBOutlet weak var variationLabel: UILabel!
	@IBOutlet weak var currentPriceLabel: UILabel!
	var cryptoModel: CryptoCurrencyModel?
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func update(with crypto: CryptoCurrencyModel) {
		self.cryptoModel = crypto

		self.cryptoNameLabel.text = crypto.name
		if let urlImage = URL(string: crypto.image) {
			self.cryptoImageView.load(url: urlImage)
		}
		self.variationLabel.text = String(crypto.priceChangePercentage24h)
		self.currentPriceLabel.text = String(crypto.currentPrice)
	}
}
