//
//  QuickNewTask.swift
//  Todo
//

import SwiftUI

struct QuickNewTask: View {
    let category: TodoEntity.Category
    
    @State var newTask: String = ""
    @Environment(\.managedObjectContext) var viewContext
    
    fileprivate func addNewTask() {
        TodoEntity.create(in: self.viewContext, category: self.category, task: self.newTask)
        self.newTask = ""
    }
    
    fileprivate func cancelTask() {
        self.newTask = ""
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("新しいタスク", text: $newTask, onCommit:  {
                    
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    self.addNewTask()
                }) {
                    Text("追加")
                }
                Button(action: {
                    self.cancelTask()
                }) {
                    Text("Cancel").foregroundColor(.red)
                }
            }
        }
    }
}

struct QuickNewTask_Previews: PreviewProvider {
    /// 永続コンテナのコントローラー生成
    static let persistenceController = PersistenceController.shared
    static let container = persistenceController.container
    static let context = container.viewContext
    
    static var previews: some View {
        QuickNewTask(category: .ImpNUrg_2nd)
            .environment(\.managedObjectContext, context)
    }
}
