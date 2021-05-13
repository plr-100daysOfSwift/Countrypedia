//
//  Country.swift
//  Countripedia
//
//  Created by Paul Richardson on 13/05/2021.
//

import Foundation

struct Country: Codable, Comparable {

	static func < (lhs: Country, rhs: Country) -> Bool {
		return lhs.name < rhs.name
	}

	let name: String
	let capitalCity: String
	let population: Int?

}
