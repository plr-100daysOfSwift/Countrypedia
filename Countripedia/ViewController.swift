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
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Countripedia"
		loadData()
	}

	fileprivate func loadData() {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase

		if let filePath = Bundle.main.url(forResource: "countries", withExtension: "json"),
			 let data = try? Data(contentsOf:filePath),
			 let decodedJSON: [Country] = try? decoder.decode([Country].self, from: data) {
			self.countries = decodedJSON.sorted()
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

	// MARK:- Table View Delegate

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		// FIXME: didSelectRowAt is being called twice the first time a row is selected after launching.
		// This results in the detail view controller being pushed to the navigaton stack twice.
		print("pushing to stack")

		let country = countries[indexPath.row]
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		if let vc = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
			vc.country = country
			navigationController?.pushViewController(vc, animated: true)
		}

	}

}

