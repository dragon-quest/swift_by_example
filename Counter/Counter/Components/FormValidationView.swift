//
//  FormValidationView.swift
//  Counter
//

import SwiftUI

struct FormValidationView: View {
    @StateObject private var viewModel = FormValidationViewModel()
    
    var body: some View {
        VStack {
            Text("10文字以内 \(viewModel.resultText)")
            TextField("", text: $viewModel.text)
        }
    }
}

struct FormValidationView_Previews: PreviewProvider {
    static var previews: some View {
        FormValidationView()
    }
}
