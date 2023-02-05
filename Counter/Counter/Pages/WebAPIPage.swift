//
//  WebAPIPage.swift
//  Counter
//

import SwiftUI

struct WebAPIPage: View {
    var body: some View {
        Form {
            WebAPIView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct WebAPIPage_Previews: PreviewProvider {
    static var previews: some View {
        WebAPIPage()
    }
}
