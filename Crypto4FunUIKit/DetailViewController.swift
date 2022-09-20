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
	var selectedImage: CryptoCurrencyModel?
	
	@IBOutlet weak var cryptoPrice: UILabel!

	override func viewDidLoad() {
        super.viewDidLoad()


		if let cryptoToLoad = selectedImage {
			if let urlToLoad = URL(string: cryptoToLoad.image) {
				imageView.load(url: urlToLoad)
				cryptoPrice.text = String(cryptoToLoad.currentPrice)
			}
		}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
