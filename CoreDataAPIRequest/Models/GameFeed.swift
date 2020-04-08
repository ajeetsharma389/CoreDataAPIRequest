/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
// MARK: - GameFeed
struct GameFeed: Codable {
    let data: [Datum]
    let meta: Meta
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let date: String
    let homeTeam: Team
    let homeTeamScore, period: Int
    let postseason: Bool
    let season: Int
    let status, time: String
    let visitorTeam: Team
    let visitorTeamScore: Int

    enum CodingKeys: String, CodingKey {
        case id, date
        case homeTeam = "home_team"
        case homeTeamScore = "home_team_score"
        case period, postseason, season, status, time
        case visitorTeam = "visitor_team"
        case visitorTeamScore = "visitor_team_score"
    }
}

// MARK: - Team
struct Team: Codable {
    let id: Int
    let abbreviation, city, conference, division: String
    let fullName, name: String

    enum CodingKeys: String, CodingKey {
        case id, abbreviation, city, conference, division
        case fullName = "full_name"
        case name
    }
}

// MARK: - Meta
struct Meta: Codable {
    let totalPages, currentPage, nextPage, perPage: Int
    let totalCount: Int

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextPage = "next_page"
        case perPage = "per_page"
        case totalCount = "total_count"
    }
}
