

import Foundation
struct Excerpt : Codable {
	let rendered : String?
	let protected : Bool?

	enum CodingKeys: String, CodingKey {

		case rendered = "rendered"
		case protected = "protected"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rendered = try values.decodeIfPresent(String.self, forKey: .rendered)
		protected = try values.decodeIfPresent(Bool.self, forKey: .protected)
	}

}
