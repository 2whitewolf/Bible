//
//  BibleModel.swift
//  Bible
//
//  Created by Bogdan Sevcenco on 1/28/22.
//

import Foundation
//struct Chapters{
//    switch Books {
//    case "Genesis":
//
//    }
//}

struct Books : Codable ,Identifiable {
//    enum CodingKeys: CodingKey {
//        case name
//        case chapters
//    }

    var id = UUID()
    var name:  String
    var chapters: Int
    
    
}

// MARK: - Bible
struct Bible: Codable {
    let book, chapter, output: String

    enum CodingKeys: String, CodingKey {
        case book = "Book"
        case chapter = "Chapter"
        case output = "Output"
    }
}

// MARK: Bible convenience initializers and mutators

extension Bible {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Bible.self, from: data)
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
        book: String? = nil,
        chapter: String? = nil,
        output: String? = nil
    ) -> Bible {
        return Bible(
            book: book ?? self.book,
            chapter: chapter ?? self.chapter,
            output: output ?? self.output
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
