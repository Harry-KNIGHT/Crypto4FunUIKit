//
//  CryptoChartView.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 23/09/2022.
//

import SwiftUI
import Crypto4FunKit

struct CryptoChartView: View {
	let crypto: CryptoCurrencyModel
    var body: some View {
		VStack {
			AsyncImage(url: URL(string: crypto.image)) { image in
				image
			} placeholder: {
				ProgressView()
			}
			Text(crypto.name)
			Text(String(crypto.currentPrice))
		}
    }
}

struct CryptoChartView_Previews: PreviewProvider {
    static var previews: some View {
		CryptoChartView(crypto: .cryptoSample)
    }
}
