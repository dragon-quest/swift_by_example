//
//  ContentView.swift
//  Todo
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        VStack {
            Color.tBackground
                .edgesIgnoringSafeArea(.top)
                .frame(height: 0)
            UserView(image: Image("profile"), userName: "Demo")
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    CategoryView(category: .ImpUrg_1st)
                    Spacer()
                    CategoryView(category: .ImpNUrg_2nd)
                }
                Spacer()
                HStack(spacing: 0) {
                    CategoryView(category: .NImpUrg_3rd)
                    Spacer()
                    CategoryView(category: .NImpNUrg_4th)
                }
            }
            .padding()
            
            TaskToday()
        }
        .background(Color.tBackground)
        .edgesIgnoringSafeArea(.bottom)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
