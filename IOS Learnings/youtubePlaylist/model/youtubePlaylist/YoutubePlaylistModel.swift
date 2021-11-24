

import Foundation
struct YoutubePlaylistModel: Codable {
	let kind : String?
	let etag : String?
	let nextPageToken : String?
	let items : [Items]?
	let pageInfo : PageInfo?

	enum CodingKeys: String, CodingKey {

		case kind = "kind"
		case etag = "etag"
		case nextPageToken = "nextPageToken"
		case items = "items"
		case pageInfo = "pageInfo"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		kind = try values.decodeIfPresent(String.self, forKey: .kind)
		etag = try values.decodeIfPresent(String.self, forKey: .etag)
		nextPageToken = try values.decodeIfPresent(String.self, forKey: .nextPageToken)
		items = try values.decodeIfPresent([Items].self, forKey: .items)
		pageInfo = try values.decodeIfPresent(PageInfo.self, forKey: .pageInfo)
	}

}
