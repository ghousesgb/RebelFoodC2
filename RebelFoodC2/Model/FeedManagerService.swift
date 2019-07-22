//
//  FeedManagerService.swift
//  RebelFoodC2
//
//  Created by Ghouse Basha Shaik on 19/07/19.
//

import Foundation

// MARK: - FeedManagerService
class FeedManagerService: Codable {
    let feed: Feed?
    
    init(feed: Feed?) {
        self.feed = feed
    }
}

// MARK: FeedManagerService convenience initializers and mutators

extension FeedManagerService {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(FeedManagerService.self, from: data)
        self.init(feed: me.feed)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        feed: Feed?? = nil
        ) -> FeedManagerService {
        return FeedManagerService(
            feed: feed ?? self.feed
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Feed
class Feed: Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright, country: String?
    let icon: String?
    let updated: String?
    let results: [Result]?
    
    init(title: String?, id: String?, author: Author?, links: [Link]?, copyright: String?, country: String?, icon: String?, updated: String?, results: [Result]?) {
        self.title = title
        self.id = id
        self.author = author
        self.links = links
        self.copyright = copyright
        self.country = country
        self.icon = icon
        self.updated = updated
        self.results = results
    }
}

// MARK: Feed convenience initializers and mutators

extension Feed {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Feed.self, from: data)
        self.init(title: me.title, id: me.id, author: me.author, links: me.links, copyright: me.copyright, country: me.country, icon: me.icon, updated: me.updated, results: me.results)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        title: String?? = nil,
        id: String?? = nil,
        author: Author?? = nil,
        links: [Link]?? = nil,
        copyright: String?? = nil,
        country: String?? = nil,
        icon: String?? = nil,
        updated: String?? = nil,
        results: [Result]?? = nil
        ) -> Feed {
        return Feed(
            title: title ?? self.title,
            id: id ?? self.id,
            author: author ?? self.author,
            links: links ?? self.links,
            copyright: copyright ?? self.copyright,
            country: country ?? self.country,
            icon: icon ?? self.icon,
            updated: updated ?? self.updated,
            results: results ?? self.results
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Author
class Author: Codable {
    let name: String?
    let uri: String?
    
    init(name: String?, uri: String?) {
        self.name = name
        self.uri = uri
    }
}

// MARK: Author convenience initializers and mutators

extension Author {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Author.self, from: data)
        self.init(name: me.name, uri: me.uri)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        name: String?? = nil,
        uri: String?? = nil
        ) -> Author {
        return Author(
            name: name ?? self.name,
            uri: uri ?? self.uri
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Link
class Link: Codable {
    let linkSelf: String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate
    }
    
    init(linkSelf: String?, alternate: String?) {
        self.linkSelf = linkSelf
        self.alternate = alternate
    }
}

// MARK: Link convenience initializers and mutators

extension Link {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Link.self, from: data)
        self.init(linkSelf: me.linkSelf, alternate: me.alternate)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        linkSelf: String?? = nil,
        alternate: String?? = nil
        ) -> Link {
        return Link(
            linkSelf: linkSelf ?? self.linkSelf,
            alternate: alternate ?? self.alternate
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Result
class Result: Codable {
    let artistName, id, releaseDate, name: String?
    let collectionName: String?
    let kind: String?
    let copyright, artistID: String?
    let artistURL: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?
    let contentAdvisoryRating: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, collectionName, kind, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url, contentAdvisoryRating
    }
    
    init(artistName: String?, id: String?, releaseDate: String?, name: String?, collectionName: String?, kind: String?, copyright: String?, artistID: String?, artistURL: String?, artworkUrl100: String?, genres: [Genre]?, url: String?, contentAdvisoryRating: String?) {
        self.artistName = artistName
        self.id = id
        self.releaseDate = releaseDate
        self.name = name
        self.collectionName = collectionName
        self.kind = kind
        self.copyright = copyright
        self.artistID = artistID
        self.artistURL = artistURL
        self.artworkUrl100 = artworkUrl100
        self.genres = genres
        self.url = url
        self.contentAdvisoryRating = contentAdvisoryRating
    }
}

// MARK: Result convenience initializers and mutators

extension Result {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Result.self, from: data)
        self.init(artistName: me.artistName, id: me.id, releaseDate: me.releaseDate, name: me.name, collectionName: me.collectionName, kind: me.kind, copyright: me.copyright, artistID: me.artistID, artistURL: me.artistURL, artworkUrl100: me.artworkUrl100, genres: me.genres, url: me.url, contentAdvisoryRating: me.contentAdvisoryRating)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        artistName: String?? = nil,
        id: String?? = nil,
        releaseDate: String?? = nil,
        name: String?? = nil,
        collectionName: String?? = nil,
        kind: String?? = nil,
        copyright: String?? = nil,
        artistID: String?? = nil,
        artistURL: String?? = nil,
        artworkUrl100: String?? = nil,
        genres: [Genre]?? = nil,
        url: String?? = nil,
        contentAdvisoryRating: String?? = nil
        ) -> Result {
        return Result(
            artistName: artistName ?? self.artistName,
            id: id ?? self.id,
            releaseDate: releaseDate ?? self.releaseDate,
            name: name ?? self.name,
            collectionName: collectionName ?? self.collectionName,
            kind: kind ?? self.kind,
            copyright: copyright ?? self.copyright,
            artistID: artistID ?? self.artistID,
            artistURL: artistURL ?? self.artistURL,
            artworkUrl100: artworkUrl100 ?? self.artworkUrl100,
            genres: genres ?? self.genres,
            url: url ?? self.url,
            contentAdvisoryRating: contentAdvisoryRating ?? self.contentAdvisoryRating
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Genre
class Genre: Codable {
    let genreID: String?
    let name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
    
    init(genreID: String?, name: String?, url: String?) {
        self.genreID = genreID
        self.name = name
        self.url = url
    }
}

// MARK: Genre convenience initializers and mutators

extension Genre {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Genre.self, from: data)
        self.init(genreID: me.genreID, name: me.name, url: me.url)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        genreID: String?? = nil,
        name: String?? = nil,
        url: String?? = nil
        ) -> Genre {
        return Genre(
            genreID: genreID ?? self.genreID,
            name: name ?? self.name,
            url: url ?? self.url
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
