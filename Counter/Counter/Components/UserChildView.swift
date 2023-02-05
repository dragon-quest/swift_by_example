//
//  UserChildView.swift
//  Counter
//

import SwiftUI
import RealmSwift

struct UserChildView: View {
    @ObservedRealmObject  var group: UserGroup = UserGroup()

    var body: some View {
        NavigationView {
            List {
                ForEach(group.users) { user in
                    RowUserView(user: user)
                }.onDelete(perform: $group.users.remove)
            }.listStyle(GroupedListStyle())
        }
        .navigationBarItems(trailing: Button(action: {
            let user1 = User()
            user1.name = "user1"
            user1.age = 30
            let user2 = User()
            user2.name = "user2"
            user2.age = 22
            let realm = try? Realm()
            try? realm?.write {
                group.users.append(user1)
                group.users.append(user2)
                realm?.add(group)
            }
        }) {
            Text("Add")
        })
        .padding()
    }
}

struct UserChildView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserChildView(group: UserGroup())
        }
    }
}
