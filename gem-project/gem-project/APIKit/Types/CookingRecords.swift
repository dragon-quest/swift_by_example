//
//  CookingRecords.swift
//  FunRecipe
//
//  Created by 中江洋史 on 2022/10/28.
//

struct CookingRecords: Codable {
    let name: String
    let description: String
    let pagination: Pagination
    let records: [CookingRecord]
}
