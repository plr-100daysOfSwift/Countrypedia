//
//  DetailViewController.swift
//  Countripedia
//
//  Created by Paul Richardson on 13/05/2021.
//

import UIKit

class DetailViewController: UIViewController {

	var country: Country!

	@IBOutlet var nameLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		nameLabel.text = country.name
	}

}
