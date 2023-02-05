//
//  WebAPIView.swift
//  Counter
//

import SwiftUI

struct WebAPIView: View {
    @StateObject private var viewModel = WebAPIViewModel()
    
    var body: some View {
        VStack {
            VStack {
                ForEach(viewModel.records, id: \.id) { record in
                    Text(record.title)
                }
            }
            // ボタンを押す度に新しいジョークを取得します
            Button(action: viewModel.fetch) {
                Text("取得")
            }
        }
    }
}

struct WebAPIView_Previews: PreviewProvider {
    static var previews: some View {
        WebAPIView()
    }
}
