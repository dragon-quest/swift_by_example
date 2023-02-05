//
//  User.swift
//  Counter
//

import Foundation
import RealmSwift

class User: Object,ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted  var name:String = ""
    @Persisted  var age:Int = 0
}

class UserGroup: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted  var users = RealmSwift.List<User>()
}
