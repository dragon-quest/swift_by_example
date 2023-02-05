//
//  PostRecord.swift
//  Counter
//

import Foundation

struct PostRecord: Codable {
    let id: Int
    let image_url: String
    let link: String
    let post_date: String
    let post_name: String
    let title: String
}
