//
//  SimpleCounterPage.swift
//  Counter
//

import SwiftUI

struct SimpleCounterPage: View {
    private let readMe = "Single Counter"
    
    var body: some View {
        Form {
            CounterView(label:  "Counter")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .buttonStyle(BorderlessButtonStyle())
        }
        .navigationBarTitle("SimpleCounter")
    }
}

struct SimpleCounterPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SimpleCounterPage()
        }
    }
}
