//
//  PostModel.swift
//  Counter
//

import Foundation

struct PostModel {
    var posts: Posts?
    
    mutating func records() -> [PostRecord] {
        return posts?.records ?? []
    }
    
    mutating func pagination() -> Pagination {
        return posts?.pagination ?? Pagination(limit: 0, offset: 0, total: 0)
    }
    
    mutating func description() -> String {
        return posts?.description ?? ""
    }
    
    mutating func name() -> String {
        return posts?.name ?? ""
    }
}
