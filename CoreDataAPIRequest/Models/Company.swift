/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Company : Codable {
	let iD : Int?
	let symbol : String?
	let name : String?
	let iSIN : String?
	let cIK : Int?
	let tradeCount : Int?
	let viewCount : Int?
	let stock : String?
	let stream : String?
	let logoPath : String?

	enum CodingKeys: String, CodingKey {

		case iD = "ID"
		case symbol = "Symbol"
		case name = "Name"
		case iSIN = "ISIN"
		case cIK = "CIK"
		case tradeCount = "TradeCount"
		case viewCount = "ViewCount"
		case stock = "Stock"
		case stream = "Stream"
		case logoPath = "LogoPath"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		iD = try values.decodeIfPresent(Int.self, forKey: .iD)
		symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		iSIN = try values.decodeIfPresent(String.self, forKey: .iSIN)
		cIK = try values.decodeIfPresent(Int.self, forKey: .cIK)
		tradeCount = try values.decodeIfPresent(Int.self, forKey: .tradeCount)
		viewCount = try values.decodeIfPresent(Int.self, forKey: .viewCount)
		stock = try values.decodeIfPresent(String.self, forKey: .stock)
		stream = try values.decodeIfPresent(String.self, forKey: .stream)
		logoPath = try values.decodeIfPresent(String.self, forKey: .logoPath)
	}

}