//
//  ViewController.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 15/09/2022.
//

import UIKit
import SwiftUI
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

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	func getCryptos() async throws {
		do {
			cryptos = try await CryptoApi.fetchCryptoCurrency()
			tableView.reloadData()
		} catch {
			print("Error fetching data")
		}
	}

	@IBSegueAction func segueToSwiftUIDetailView(_ coder: NSCoder) -> UIViewController? {
		return UIHostingController(coder: coder, rootView: CryptoChartView(crypto: .cryptoSample))
	}
}
