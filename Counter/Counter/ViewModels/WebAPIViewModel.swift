//
//  WebAPIViewModel.swift
//  Counter
//

import Foundation
import Combine

final class WebAPIViewModel: ObservableObject {
    @Published var model = PostModel()
    
    private var cancellables: [AnyCancellable] = []
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
    var records: [PostRecord] {
        return model.posts?.records ?? []
    }

    func fetch() {
        guard let url = URL(string: "https://api.gem-project.shop/v1/posts/tweet") else {
            return
        }
            
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, _: URLResponse) in return data }
            .decode(type: Posts.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finish.")
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { [weak self] response in
                self?.model.posts = response
            })
            .store(in: &cancellables)
    }
}
