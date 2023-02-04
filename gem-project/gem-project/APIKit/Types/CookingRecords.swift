//
//  CookingRecords.swift
//  FunRecipe
//

struct CookingRecords: Codable {
    let name: String
    let description: String
    let pagination: Pagination
    let records: [CookingRecord]
}
