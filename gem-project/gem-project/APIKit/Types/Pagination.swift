//
//  Pagination.swift
//  FunRecipe
//

struct Pagination: Codable {
    let limit: Int
    let offset: Int
    let total: Int
}
