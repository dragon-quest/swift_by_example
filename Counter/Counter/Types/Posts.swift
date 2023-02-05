//
//  Posts.swift
//  Counter
//

import Foundation

struct Posts: Codable {
    let name: String
    let description: String
    let pagination: Pagination
    let records: [PostRecord]
}
