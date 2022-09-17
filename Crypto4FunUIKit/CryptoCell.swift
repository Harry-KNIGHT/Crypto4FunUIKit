//
//  CryptoCell.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 17/09/2022.
//

import UIKit

class CryptoCell: UITableViewCell {

	@IBOutlet weak var cryptoImageView: UIView!
	@IBOutlet weak var cryptoNameLabel: UILabel!
	

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
