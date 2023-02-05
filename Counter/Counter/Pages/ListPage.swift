//
//  ListPage.swift
//  Counter
//

import SwiftUI

struct ListPage: View {
    var body: some View {
        NavigationView {
            HStack(alignment: .top, spacing: 0, content: {
                ListView()
                Spacer()
            })
        }
    }
}

struct ListPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListPage()
        }
    }
}
