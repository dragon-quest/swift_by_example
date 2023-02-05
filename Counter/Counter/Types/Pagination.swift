//
//  Pagination.swift
//  Counter
//

struct Pagination: Codable {
    let limit: Int
    let offset: Int
    let total: Int
}
