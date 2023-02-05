//
//  ListView.swift
//  Counter
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            NavigationLink(
                destination: CounterView(label: "a1"),
                label: {
                    Text("Navigate 1")
                })
            NavigationLink(
                destination: CounterView(label: "b2"),
                label: {
                    Text("Navigate 2")
                })
            NavigationLink(
                destination: FormValidationView(),
                label: {
                    Text("Navigate 3")
                })
            NavigationLink(
                destination: WebAPIView(),
                label: {
                    Text("Navigate 4")
                })
            NavigationLink(
                destination: UserView(),
                label: {
                    Text("Navigate 5")
                })
            NavigationLink(
                destination: ShopView(),
                label: {
                    Text("Navigate 6")
                })
            NavigationLink(
                destination: ShopView(),
                label: {
                    Text("Navigate 7")
                })
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
