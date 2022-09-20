//
//  ViewController.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 15/09/2022.
//

import UIKit
import Crypto4FunKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	var cryptos = [CryptoCurrencyModel]()

	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		Task {
			do {
				try await getCryptos()
			} catch {
				print("Error in viewDidLoad")
			}
		}
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cryptos.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoCell

		let currentCrypto = cryptos[indexPath.row]
		cell.cryptoNameLabel.text = currentCrypto.name
		if let urlImage = URL(string: currentCrypto.image) {
			cell.cryptoImageView.load(url: urlImage)
		}
		
		return cell
	}

	func getCryptos() async throws {
		do {
			cryptos = try await CryptoApi.fetchCryptoCurrency()
			tableView.reloadData()
		} catch {
			print("Error fetching data")
		}
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			vc.selectedCrypto = cryptos[indexPath.row]
			navigationController?.pushViewController(vc, animated: true)
		}
	}
}
