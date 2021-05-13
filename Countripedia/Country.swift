//
//  Country.swift
//  Countripedia
//
//  Created by Paul Richardson on 13/05/2021.
//

import Foundation

struct Country: Codable {

	enum CodingKeys: String, CodingKey {
		case name
		case capital = "capital_city"
		case population
	}

	let name: String
	let capital: String
	let population: Int?

}
