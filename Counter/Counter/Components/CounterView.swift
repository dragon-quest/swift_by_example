//
//  CounterView.swift
//  Counter
//

import SwiftUI

struct CounterView: View {
    @StateObject private var counterViewModel = CounterViewModel()
    var label: String
    
    var body: some View {
        HStack {
            Text("\(label):")
                .padding()
                .font(.subheadline)
            Button("-") { counterViewModel.decrement() }
            Text("\(counterViewModel.count)")
            Button("+") { counterViewModel.increment() }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(label: "Counter")
    }
}
