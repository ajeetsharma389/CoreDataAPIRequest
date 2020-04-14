/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gameFeed = try GameFeed(json)

import Foundation

// MARK: - GameFeed
struct GameFeed: Codable {
    let data: [Datum]
    let meta: Meta
}

// MARK: GameFeed convenience initializers and mutators

extension GameFeed {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GameFeed.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        data: [Datum]? = nil,
        meta: Meta? = nil
    ) -> GameFeed {
        return GameFeed(
            data: data ?? self.data,
            meta: meta ?? self.meta
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
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

// MARK: Datum convenience initializers and mutators

extension Datum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Datum.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        date: String? = nil,
        homeTeam: Team? = nil,
        homeTeamScore: Int? = nil,
        period: Int? = nil,
        postseason: Bool? = nil,
        season: Int? = nil,
        status: String? = nil,
        time: String? = nil,
        visitorTeam: Team? = nil,
        visitorTeamScore: Int? = nil
    ) -> Datum {
        return Datum(
            id: id ?? self.id,
            date: date ?? self.date,
            homeTeam: homeTeam ?? self.homeTeam,
            homeTeamScore: homeTeamScore ?? self.homeTeamScore,
            period: period ?? self.period,
            postseason: postseason ?? self.postseason,
            season: season ?? self.season,
            status: status ?? self.status,
            time: time ?? self.time,
            visitorTeam: visitorTeam ?? self.visitorTeam,
            visitorTeamScore: visitorTeamScore ?? self.visitorTeamScore
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
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

// MARK: Team convenience initializers and mutators

extension Team {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Team.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        abbreviation: String? = nil,
        city: String? = nil,
        conference: String? = nil,
        division: String? = nil,
        fullName: String? = nil,
        name: String? = nil
    ) -> Team {
        return Team(
            id: id ?? self.id,
            abbreviation: abbreviation ?? self.abbreviation,
            city: city ?? self.city,
            conference: conference ?? self.conference,
            division: division ?? self.division,
            fullName: fullName ?? self.fullName,
            name: name ?? self.name
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
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

// MARK: Meta convenience initializers and mutators

extension Meta {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Meta.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        totalPages: Int? = nil,
        currentPage: Int? = nil,
        nextPage: Int? = nil,
        perPage: Int? = nil,
        totalCount: Int? = nil
    ) -> Meta {
        return Meta(
            totalPages: totalPages ?? self.totalPages,
            currentPage: currentPage ?? self.currentPage,
            nextPage: nextPage ?? self.nextPage,
            perPage: perPage ?? self.perPage,
            totalCount: totalCount ?? self.totalCount
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
