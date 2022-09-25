//
//  CryptoChartView.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 23/09/2022.
//

import SwiftUI
import Crypto4FunKit
import Charts

struct CryptoChartView: View {
	@State private var showAveragePrice: Bool = false
	@Environment(\.colorScheme) private var colorScheme
	var cryptoCurrency: CryptoCurrencyModel

	@State private var epochTimeToShowSelected: EpochUnixTime = .month
	public let detailViewController: DetailViewController
	@State private var isTaskLoaded: Bool = false
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .leading) {
				Text("$\(String(cryptoCurrency.currentPrice.formatted()))")
					.font(.title.bold())
					.padding([.top, .leading], 8)
					.padding(.bottom, 0)

				Chart {
					ForEach(detailViewController.priceToShowOnShart, id: \.self) {
						LineMark(
							x: .value("Date", Date(miliseconds: Int64($0[0]))),
							y: .value("Price", $0[1])
						)
						.foregroundStyle(detailViewController.pricePercentageValue < 0 ? .red : .green)
					}
					if showAveragePrice {
						RuleMark(
							y: .value("Average price", detailViewController.averagePrice)
						)
						.foregroundStyle(colorScheme == .dark ? .white : .black)
					}
				}
				.chartYScale(domain: .automatic(includesZero: false))
				.frame(maxWidth: .infinity, minHeight: 500, maxHeight: 700)
				.padding(.trailing, 5)
				.task {
						do {
							try await detailViewController.getChart(cryptoCurrency.id, from: Date().timeIntervalSince1970 - EpochUnixTime.month.rawValue)
							isTaskLoaded = true

						} catch {
							print("Error \(error.localizedDescription)")
						}
				}
				.onChange(of: epochTimeToShowSelected, perform: { _ in
					Task {
						do {
							try await detailViewController.getChart(cryptoCurrency.id, from: Date().timeIntervalSince1970 - epochTimeToShowSelected.rawValue)
						}
					}
				})
				if isTaskLoaded {
					Picker("Select time value", selection: $epochTimeToShowSelected) {
						ForEach(EpochUnixTime.allCases, id: \.self) { value in
							Text(String(value.name))
								.tag(value)
						}
					}
					.pickerStyle(.segmented)
					.padding([.vertical, .horizontal])
				}
				Divider()
					.padding(.horizontal,40)
				ToggleAveragePriceView(showAveragePrice: $showAveragePrice)
					.padding(.horizontal)
			}
		}
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle(cryptoCurrency.name)
	}
}

struct CryptoChartView_Previews: PreviewProvider {
	static var previews: some View {
		CryptoChartView(cryptoCurrency: .cryptoSample, detailViewController: DetailViewController())
	}
}


struct ToggleAveragePriceView: View {
	@Binding var showAveragePrice: Bool
	var body: some View {
		Toggle("Average", isOn: $showAveragePrice)
			.tint(.primary)
			.padding(.top)
	}
}
