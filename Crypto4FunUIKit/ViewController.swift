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

		self.navigationItem.title = "Crypto4Fun"
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
		cell.update(with: currentCrypto)
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
		tableView.deselectRow(at: indexPath, animated: true)
		let selectedCrypto = cryptos[indexPath.row]
		performSegue(withIdentifier: "DetailSegue", sender: selectedCrypto)
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let detailViewController = segue.destination as? DetailViewController, let selectedCrypto = sender as? CryptoCurrencyModel else { return }

		detailViewController.selectedCrypto = selectedCrypto
	}
}
