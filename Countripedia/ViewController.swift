//
//  ViewController.swift
//  Countripedia
//
//  Created by Paul Richardson on 13/05/2021.
//

import UIKit

class ViewController: UITableViewController {

	var countries = [Country]()

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Countripedia"
		loadData()
	}

	fileprivate func loadData() {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase

		if let filePath = Bundle.main.url(forResource: "countries", withExtension: "json"),
			 let data = try? Data(contentsOf:filePath),
			 let decodedJSON: [Country] = try? decoder.decode([Country].self, from: data) {
			// TODO: Sort the countries
			self.countries = decodedJSON
		}
	}

	// MARK:- Table View Data Source

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return countries.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
		let country = countries[indexPath.row]
		cell.textLabel?.text = country.name
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let country = countries[indexPath.row]
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		if let vc = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
			vc.country = country
			navigationController?.pushViewController(vc, animated: true)
			// FIX: It is possible to push the controller twice to the navigation stack
		}

	}

}

