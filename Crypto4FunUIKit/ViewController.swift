//
//  ViewController.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 15/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	var cryptos: [CryptoModel] = []

	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		let crypto0 = CryptoModel(imageName: "crypto0", name: "Bitcoin")
		let crypto1 = CryptoModel(imageName: "crypto1", name: "Ethereum")
		let crypto2 = CryptoModel(imageName: nil, name: "BNB")

		cryptos = [crypto0, crypto1, crypto2]
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cryptos.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoCell

		let currentCrypto = cryptos[indexPath.row]
		cell.cryptoNameLabel.text = currentCrypto.name

		// Image doesn't appear in simulator.
		if let imageName = currentCrypto.imageName {
			cell.cryptoImageView.largeContentImage = UIImage(named: imageName)
		}
		return cell
	}

}


