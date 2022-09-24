//
//  DetailViewController.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 20/09/2022.
//

import UIKit
import Crypto4FunKit

class DetailViewController: UIViewController {
	@IBOutlet weak var imageView: UIImageView!
	var selectedCrypto: CryptoCurrencyModel?
	
	@IBOutlet weak var cryptoPrice: UILabel!

	override func viewDidLoad() {
        super.viewDidLoad()


		if let cryptoToLoad = selectedCrypto {
			if let urlToLoad = URL(string: cryptoToLoad.image) {
				imageView.load(url: urlToLoad)
				cryptoPrice.text = String(cryptoToLoad.currentPrice)
				self.navigationItem.title = cryptoToLoad.name
			}
		}

    }

	var priceToShowOnShart: [[Double]] = [[Double]]()

	var averagePrice: Double {
		let valueArray = priceToShowOnShart.map { $0[1] }
		let sum = valueArray.reduce(0, +)

		return sum / Double(valueArray.count)
	}

	var pricePercentageValue: Double {
		let priceValue = priceToShowOnShart.map { $0[1] }
		let longTimePrice = Double(priceValue.first ?? 0)
		let actualPrice = Double(priceValue.last ?? 0)

		let percentagePrice =  (actualPrice - longTimePrice) / longTimePrice * 100

		return percentagePrice
	}

	func getChart(_ id: String, from firstDate: Double, to today: Double = Date().timeIntervalSince1970) async throws {
		do {
			let data = try await ChartApi.fetchChart(id, from: firstDate)
			priceToShowOnShart = data.prices
		} catch {
			throw error
		}
	}

}
