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

	required init?(coder: NSCoder, cryptoModel: CryptoCurrencyModel) {
		self.cryptoModel = cryptoModel
		super.init(coder: coder, rootView: CryptoChartView(crypto: cryptoModel))
	}

	required init?(coder: NSCoder) {
	 fatalError("init(coder:) has not been implemented")
	}
}
