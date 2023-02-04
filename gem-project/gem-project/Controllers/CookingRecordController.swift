//
//  CookingRecordController.swift
//  FunRecipe
//
//  Created by 中江洋史 on 2022/10/27.
//

import UIKit

class CookingRecordController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private let viewModel = CookingRecordViewModel()
    private var items: [CookingRecordItem] = []
    private var isLoading = false
    private var isScroll: Bool {
        return tableView.contentOffset.y + tableView.frame.size.height > tableView.contentSize.height && tableView.isDragging && !isLoading
    }
    private var heightRow: [IndexPath: CGFloat] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = "CookingRecordTableView"
        setupBinders()
        tableView.register(CookingRecordTableViewCell.nib(), forCellReuseIdentifier: CookingRecordTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.cookingRecord()
    }
    
    private func setupBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                let alert: UIAlertController = UIAlertController(title: "ALERT_ERROR_TITLE".localized(), message: error, preferredStyle: .alert)
                let defaultAction: UIAlertAction = UIAlertAction(title: "ALERT_OK_BUTTON_TITLE".localized(), style: .default)
                alert.addAction(defaultAction)
                
                self?.present(alert, animated: true, completion: nil)
            }
        }
        
        viewModel.model.bind { [weak self] model in
            self?.items = model.items
            self?.tableView.reloadData()
            self?.isLoading = false
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isScroll {
            isLoading = true
            viewModel.cookingRecord()
        }
    }
}

extension CookingRecordController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let h = heightRow[indexPath] {
            return h
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CookingRecordTableViewCell.identifier, for: indexPath) as! CookingRecordTableViewCell
        cell.tag = indexPath.row
        heightRow[indexPath] = cell.frame.height
        let item = items[indexPath.row]
        if item.imageData == nil {
            viewModel.getImage(row: indexPath.row)
        }
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:  true)
    }
}
