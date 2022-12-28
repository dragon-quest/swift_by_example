//
//  TodoList.swift
//  Todo
//

import SwiftUI
import CoreData

struct TodoList: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.time, ascending: true)], animation: .default)
    
    var todoList: FetchedResults<TodoEntity>
    
    @Environment(\.managedObjectContext) var viewContext
    
    @ObservedObject var keyboard = KeyboardObserver()
    
    fileprivate func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let entity = todoList[index]
            viewContext.delete(entity)
        }
        
        do {
            try viewContext.save()
        } catch {
            print("Delete Error. \(offsets)")
        }
    }
    
    let category: TodoEntity.Category
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todoList) { todo in
                        if todo.category == self.category.rawValue {
                            NavigationLink(
                                destination: EditTask(todo: todo)) {
                                TodoDetailRow(todo: todo, hideIcon: true)
                            }
                        }
                    }
                    .onDelete(perform: deleteTodo)
                }
                QuickNewTask(category: category)
                    .padding()
            }
            .navigationBarTitle(category.toString())
            .navigationBarItems(trailing: EditButton())
        }
        .onAppear {
            self.keyboard.startObserve()
            UIApplication.shared.closeKeyboard()
        }
        .onDisappear {
            self.keyboard.stopObserve()
            UIApplication.shared.closeKeyboard()
        }
        .padding(.bottom, keyboard.keyboardHeight)
    }
}

struct TodoList_Previews: PreviewProvider {
    /// 永続コンテナのコントローラー生成
    static let persistenceController = PersistenceController.shared
    static let container = persistenceController.container
    static let context = container.viewContext
    
    static var previews: some View {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        try! container.persistentStoreCoordinator.execute(deleteRequest, with: context)
        
        TodoEntity.create(in: context, category: .ImpUrg_1st, task: "炎上プロジェクト")
        
        TodoEntity.create(in: context, category: .ImpNUrg_2nd, task: "自己啓発")
        
        TodoEntity.create(in: context, category: .NImpUrg_3rd, task: "意味のない会議")
        
        TodoEntity.create(in: context, category: .NImpNUrg_4th, task: "暇つぶし")
        
        return TodoList(category: .ImpUrg_1st).environment(\.managedObjectContext, context)
        
    }
}
