//
//  UserView.swift
//  Counter
//

import SwiftUI
import RealmSwift

struct UserView: View {
    @ObservedResults(UserGroup.self) var groups
    
    var body: some View {
        if let group = groups.first {
            UserChildView(group: group)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
