

import Foundation
struct Thumbnails : Codable {
    let `default` : Default?
	let medium : Medium?
	let high : High?
	let standard : Standard?
	let maxres : Maxres?

	enum CodingKeys: String, CodingKey {

        case `default` = "default"
		case medium = "medium"
		case high = "high"
		case standard = "standard"
		case maxres = "maxres"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
       `default` = try values.decodeIfPresent(Default.self, forKey: .default)
		medium = try values.decodeIfPresent(Medium.self, forKey: .medium)
		high = try values.decodeIfPresent(High.self, forKey: .high)
		standard = try values.decodeIfPresent(Standard.self, forKey: .standard)
		maxres = try values.decodeIfPresent(Maxres.self, forKey: .maxres)
	}

}
