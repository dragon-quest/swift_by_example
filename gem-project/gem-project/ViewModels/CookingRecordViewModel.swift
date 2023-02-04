//
//  CookingRecordViewModel.swift
//  FunRecipe
//

final class CookingRecordViewModel {
    var model: ObservableObject<CookingRecordModel> = ObservableObject(CookingRecordModel(limit: 10))
    var error: ObservableObject<String?> = ObservableObject(nil)
    
    func cookingRecord() {
        if model.value.isTotal {
            return
        }
        let offset = model.value.rowCount
        let limit = model.value.limit
        
        NetworkService.shared.cookingRecord(offset, limit) { [weak self] data, error  in
            if let error = error {
                self?.error.value = error._domain
            }
            if let data = data {
                if data.pagination.offset == 0 {
                    // first list data
                    var items: [CookingRecordItem] = []
                    for item in data.records {
                        items.append(CookingRecordItem(cookingRecord: item))
                    }
                    self?.model.value = CookingRecordModel(pagination: data.pagination, items: items)
                } else {
                    // add list data
                    var items: [CookingRecordItem] = self?.model.value.items ?? []
                    for item in data.records {
                        items.append(CookingRecordItem(cookingRecord: item))
                    }
                    self?.model.value = CookingRecordModel(pagination: data.pagination, items: items)
                }
            }
        }
    }
    
    func getImage(row: Int) {
        guard row < model.value.items.count else {
            return
        }
        
        let url = model.value.items[row].imageUrl
        NetworkService.shared.getImageData(url: url) { [weak self] data, error  in
            if let error = error,
               let _ = self?.model.value.pagination,
               let _ = self?.model.value.items {
                self?.error.value = error._domain
                // Set error image
                //self?.model.value = CookingRecordModel(pagination: pagination, items: items, row: row, data: data)
            }
            if let data = data,
               let pagination = self?.model.value.pagination,
               let items = self?.model.value.items {
                self?.model.value = CookingRecordModel(pagination: pagination, items: items, row: row, data: data)
            }
        }
    }
}
