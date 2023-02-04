//
//  Pagination.swift
//  FunRecipe
//
//  Created by 中江洋史 on 2022/10/28.
//

struct Pagination: Codable {
    let limit: Int
    let offset: Int
    let total: Int
}
