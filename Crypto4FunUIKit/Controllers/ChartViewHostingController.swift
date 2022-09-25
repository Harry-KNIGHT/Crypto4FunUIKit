//
//  SwiftUIHostingController.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 24/09/2022.
//

import SwiftUI
import Crypto4FunKit

class CryptoChartViewHostingController: UIHostingController<CryptoChartView> {
	private let cryptoModel: CryptoCurrencyModel
	private let detailViewController: DetailViewController

	required init?(coder: NSCoder, cryptoModel: CryptoCurrencyModel, detailViewController: DetailViewController) {
		self.cryptoModel = cryptoModel
		self.detailViewController = detailViewController
		super.init(coder: coder, rootView: CryptoChartView(cryptoCurrency: cryptoModel, detailViewController: detailViewController))
	}

	required init?(coder: NSCoder) {
	 fatalError("init(coder:) has not been implemented")
	}
}
