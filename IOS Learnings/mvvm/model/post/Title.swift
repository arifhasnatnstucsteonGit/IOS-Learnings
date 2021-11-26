

import Foundation
struct Title : Codable {
	let rendered : String?

	enum CodingKeys: String, CodingKey {

		case rendered = "rendered"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rendered = try values.decodeIfPresent(String.self, forKey: .rendered)
	}

}
