/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Json4Swift_Base : Codable {
	let newsID : Int?
	let company : Company?
	let symbol : String?
	let title : String?
	let content : String?
	let type : Int?
	let created : String?
	let uRL : String?
	let generatedURL : String?
	let duration : String?
	let comments : [String]?
	let likes : [String]?
	let likesCount : Int?
	let dislikesCount : Int?
	let commentsCount : Int?

	enum CodingKeys: String, CodingKey {

		case newsID = "NewsID"
		case company = "Company"
		case symbol = "Symbol"
		case title = "Title"
		case content = "Content"
		case type = "Type"
		case created = "Created"
		case uRL = "URL"
		case generatedURL = "GeneratedURL"
		case duration = "Duration"
		case comments = "Comments"
		case likes = "Likes"
		case likesCount = "LikesCount"
		case dislikesCount = "DislikesCount"
		case commentsCount = "CommentsCount"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		newsID = try values.decodeIfPresent(Int.self, forKey: .newsID)
		company = try values.decodeIfPresent(Company.self, forKey: .company)
		symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		content = try values.decodeIfPresent(String.self, forKey: .content)
		type = try values.decodeIfPresent(Int.self, forKey: .type)
		created = try values.decodeIfPresent(String.self, forKey: .created)
		uRL = try values.decodeIfPresent(String.self, forKey: .uRL)
		generatedURL = try values.decodeIfPresent(String.self, forKey: .generatedURL)
		duration = try values.decodeIfPresent(String.self, forKey: .duration)
		comments = try values.decodeIfPresent([String].self, forKey: .comments)
		likes = try values.decodeIfPresent([String].self, forKey: .likes)
		likesCount = try values.decodeIfPresent(Int.self, forKey: .likesCount)
		dislikesCount = try values.decodeIfPresent(Int.self, forKey: .dislikesCount)
		commentsCount = try values.decodeIfPresent(Int.self, forKey: .commentsCount)
	}

}

