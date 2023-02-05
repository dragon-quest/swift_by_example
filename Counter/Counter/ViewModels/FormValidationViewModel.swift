//
//  FormValidationViewModel.swift
//  Counter
//

import Foundation
import Combine

final class FormValidationViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var isValidText: Bool = true
    
    var resultText: String {
        return isValidText ? "○" : "×"
    }
    
    private var cancellables: [AnyCancellable] = []
    
    init() {
        subscribeTextField()
    }
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }

    func subscribeTextField() {
        $text.receive(on: DispatchQueue.main)
            .map { value in
                return value.count < 11
            }
            .assign(to: \.isValidText, on: self)
            .store(in: &cancellables)
    }
}
