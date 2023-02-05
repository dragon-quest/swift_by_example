//
//  ShopView.swift
//  Counter
//

import SwiftUI
import RealmSwift

struct ShopView: View {
    var body: some View {
        VStack {
            Button(action: {
                // レコードの生成
                let shop = Shop()
                shop.name = "Chez Ame"
                let menu = Menu()
                menu.name = "Chocolate"
                menu.price = 400
                shop.menu = menu
                
                // 保存
                let realm = try! Realm()
                try! realm.write {
                    realm.add(shop)
                }

            }, label: {
                Text("追加")
            })
            Button(action: {
                let realm = try! Realm()

                let shopTable = realm.objects(Shop.self)
                print(shopTable)
            }, label: {
                Text("Shop取得")
            })
            Button(action: {
                let realm = try! Realm()

                let menuTable = realm.objects(Menu.self)
                print(menuTable[0])
            }, label: {
                Text("Menu取得")
            })
            Button(action: {
                let realm = try! Realm()


                let shopTable = realm.objects(Shop.self)
                
                if let result = shopTable.where({ $0.menu.price > 300 }).first  {
                    print(result)
                }else{
                    print("データがありません")
                }
            }, label: {
                Text("300円以上のShop取得")
            })
            Button(action: {
                    
                let realm = try! Realm()

                let menuTable = realm.objects(Menu.self).first!
                try! realm.write{
                    menuTable.price = 1000
                }

            }, label: {
                Text("更新")
            })
            Button(action: {
               let realm = try! Realm()
               try! realm.write{
                   let shopTable = realm.objects(Shop.self)
                   realm.delete(shopTable)
               }
           }, label: {
               Text("削除")
           })
            Button(action: {
               let realm = try! Realm()
                let shopTable = realm.objects(Shop.self)
               let result = shopTable.where({ $0.menu.price > 300 }).first!
               try! realm.write{
                   realm.delete(result)
               }
           }, label: {
               Text("削除")
           })
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
