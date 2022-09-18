//
//  ExtensionUIImageView.swift
//  Crypto4FunUIKit
//
//  Created by Elliot Knight on 18/09/2022.
//

import UIKit

extension UIImageView {
	public func load(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			}
		}
	}
}
