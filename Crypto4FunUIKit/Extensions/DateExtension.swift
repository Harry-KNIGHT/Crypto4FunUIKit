//
//  DateExtension.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 24/09/2022.
//

import Foundation

extension Date {
	var millisecondsSince1970: Int64 {
		Int64((self.timeIntervalSince1970 * 1000.0).rounded())
	}

	init(miliseconds: Int64) {
		self = Date(timeIntervalSince1970: TimeInterval(miliseconds) / 1000)
	}
}

