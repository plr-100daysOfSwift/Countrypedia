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

		let JSON = """
			[
			{
			"name": "India",
			"capital": "New Delhi"
			},
			{
			"name": "Australia",
			"capital": "Canberra"
			}
			]
			"""

		let jsonData = JSON.data(using: .utf8)!
		let countries: [Country] = try! JSONDecoder().decode([Country].self, from: jsonData)

		self.countries = countries

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
		}

	}

}

