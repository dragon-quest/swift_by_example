//
//  RowUserView.swift
//  Counter
//

import SwiftUI
import RealmSwift

struct RowUserView: View {
    @ObservedRealmObject  var user:User
    
    var body: some View {
        HStack{
            Text(user.name)
            Text("\(user.age)")
        }.onTapGesture {
            let thawUser = user.thaw()
            try! thawUser?.realm!.write{
                thawUser?.age = 100
          }
        }
    }
}

struct RowUserView_Previews: PreviewProvider {
    static var previews: some View {
        RowUserView(user: User())
    }
}
