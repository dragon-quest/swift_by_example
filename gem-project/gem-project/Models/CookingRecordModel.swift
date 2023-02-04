//
//  CookingRecordModel.swift
//  FunRecipe
//

import Foundation

struct CookingRecordItem {
    var cookingRecord: CookingRecord
    
    var imageData: Data? = nil
    
    var id: Int {
        return cookingRecord.id
    }
    var imageUrl: String {
        return cookingRecord.image_url
    }
    var link: String {
        return cookingRecord.link
    }
    var postDate: String {
        return cookingRecord.post_date
    }
    var postName: String {
        return cookingRecord.post_name
    }
    var title: String {
        return cookingRecord.title
    }
}

final class CookingRecordModel {
    var pagination: Pagination
    
    var items: [CookingRecordItem] = []
    
    var total: Int {
        return pagination.total
    }
    
    var limit: Int {
        return pagination.limit
    }
    
    var offset: Int {
        return pagination.offset
    }
    
    var rowCount: Int {
        return items.count
    }
    
    var isTotal: Bool {
        return total == rowCount
    }
    
    init(limit: Int = 5) {
        pagination = Pagination(limit: limit, offset: 0, total: -1)

        items = []
    }
    
    init(pagination: Pagination, items: [CookingRecordItem]) {
        self.pagination = pagination
        self.items = items
    }
    
    init(pagination: Pagination, items: [CookingRecordItem], row: Int, data: Data) {
        self.pagination = pagination
        self.items = items
        self.items[row].imageData = data
    }
}
