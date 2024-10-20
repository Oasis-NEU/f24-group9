//
//  ContentView.swift
//  choreChamp-V2
//
//  Created by Jayden Ngo on 10/20/24.
//

import SwiftUI


// Updated ContentView
struct ContentView: View {
    var body: some View {
        
        MainTabView()
        
        NavigationStack {
            //creating list through the e
            List(TotalItemsTrading.TradingItems) { item in
                NavigationLink {
                    Text("Detail View")
                } label: {
                    TradingTableView(imageName: item.imageName, title: item.title, who: item.who, when: item.when, due: item.due)
                        .padding(.vertical, 8)
                }
            }
            .navigationTitle("Trading Table")
        }
        
        
        //adds a navigation button to the right and you can see detials
        NavigationStack {
            //creating list through the e
            List(TotalItems.toDoItems) { item in
                NavigationLink {
                    Text("Detail View")
                } label: {
                    ListRowView(imageName: item.imageName, title: item.title, who: item.who, when: item.when, due: item.due)
                        .padding(.vertical, 8)
                }
            }
            .navigationTitle("My Tasks")
        }
        .accentColor(.green)
        
    }
}

//// Updated Preview
//struct ListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowView(imageName: "star.fill", title: "French Toast Muffin", who: "jayden", when: "2 days ago", due: "test")
//    }
//}

//an item so that we can put
struct ToDoItem: Identifiable {
  var id = UUID()
  var title: String
  var imageName: String = "star.fill"
  var who: String
  var when: String
  var due: String
}

//an item so that we can put for TRADING TABLE
struct TradingItem: Identifiable {
  var id = UUID()
  var who: String
  var imageName: String = "star.fill"
  var when: String
  var title: String
  var due: String
}

struct TotalItemsTrading {
    //in the future we will add items whenever a person adds an item, so retrieve data from api and add it here
  static let TradingItems = [
    TradingItem(who: "Jayden", when: "2 days ago", title: "WASH DISHES", due: ""),
    TradingItem(who: "Jayden", when: "2 days ago", title: "WASH DISHES", due: ""),
    TradingItem(who: "Jayden", when: "2 days ago", title: "WASH DISHES", due: ""),
  ]
}


struct TotalItems {
    //in the future we will add items whenever a person adds an item, so retrieve data from api and add it here
  static let toDoItems = [
    ToDoItem(title: "Wash", who: "jayden", when: "2 days ago", due: ""),
    ToDoItem(title: "Wash", who: "jayden", when: "2 days ago", due: ""),
    ToDoItem(title: "Wash", who: "jayden", when: "2 days ago", due: ""),
    ToDoItem(title: "Wash the dishes and other ", who: "jayden", when: "2 days ago", due: "test"),
    ToDoItem(title: "Wash", who: "jayden", when: "2 days ago", due: "test"),
  ]
}
