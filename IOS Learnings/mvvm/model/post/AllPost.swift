/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct AllPost : Codable {
	let id : Int?
	let date : String?
	let date_gmt : String?
	let guid : Guid?
	let modified : String?
	let modified_gmt : String?
	let slug : String?
	let status : String?
	let type : String?
	let link : String?
	let title : Title?
	let content : Content?
	let excerpt : Excerpt?
	let author : Int?
	let featured_media : Int?
	let comment_status : String?
	let ping_status : String?
	let sticky : Bool?
	let template : String?
	let format : String?
	let meta : [String]?
	let categories : [Int]?
	let tags : [String]?


	enum CodingKeys: String, CodingKey {

		case id = "id"
		case date = "date"
		case date_gmt = "date_gmt"
		case guid = "guid"
		case modified = "modified"
		case modified_gmt = "modified_gmt"
		case slug = "slug"
		case status = "status"
		case type = "type"
		case link = "link"
		case title = "title"
		case content = "content"
		case excerpt = "excerpt"
		case author = "author"
		case featured_media = "featured_media"
		case comment_status = "comment_status"
		case ping_status = "ping_status"
		case sticky = "sticky"
		case template = "template"
		case format = "format"
		case meta = "meta"
		case categories = "categories"
		case tags = "tags"
		
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		date_gmt = try values.decodeIfPresent(String.self, forKey: .date_gmt)
		guid = try values.decodeIfPresent(Guid.self, forKey: .guid)
		modified = try values.decodeIfPresent(String.self, forKey: .modified)
		modified_gmt = try values.decodeIfPresent(String.self, forKey: .modified_gmt)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		link = try values.decodeIfPresent(String.self, forKey: .link)
		title = try values.decodeIfPresent(Title.self, forKey: .title)
		content = try values.decodeIfPresent(Content.self, forKey: .content)
		excerpt = try values.decodeIfPresent(Excerpt.self, forKey: .excerpt)
		author = try values.decodeIfPresent(Int.self, forKey: .author)
		featured_media = try values.decodeIfPresent(Int.self, forKey: .featured_media)
		comment_status = try values.decodeIfPresent(String.self, forKey: .comment_status)
		ping_status = try values.decodeIfPresent(String.self, forKey: .ping_status)
		sticky = try values.decodeIfPresent(Bool.self, forKey: .sticky)
		template = try values.decodeIfPresent(String.self, forKey: .template)
		format = try values.decodeIfPresent(String.self, forKey: .format)
		meta = try values.decodeIfPresent([String].self, forKey: .meta)
		categories = try values.decodeIfPresent([Int].self, forKey: .categories)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		
	}

}
