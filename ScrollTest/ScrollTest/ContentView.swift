//
//  ContentView.swift
//  ScrollTest
//
//  Created by Daniel Saidi on 2020-11-08.
//

import SwiftUI

struct ContentView: View {
  
  enum Tab { case list, grid1, grid2 }
  
  
  var body: some View {
    TabView {
      ListView().tabItem { Text("List") }.tag(Tab.list)
      GridView().tabItem { Text("Grid") }.tag(Tab.grid1)
      GridView().tabItem { Text("Grid") }.tag(Tab.grid2)
    }
  }
}
struct UniqItem: Identifiable {
  var id: UUID = UUID()
  
  typealias ID = UUID
}
struct ListView: View {
  var uniqItems: [UniqItem] = (0...100).map { _ in UniqItem() }
  var body: some View {
    ScrollView(.vertical) {
      LazyVStack {
        ForEach(uniqItems, id: \.id) { _ in
          horizontalList
        }
      }
    }
  }
}

extension ListView {
  
  var horizontalList: some View {
    ScrollView(.horizontal) {
      LazyHStack {
        ForEach((0...100).map { _ in UniqItem() }, id: \.id) { index in
          Button(action: { print("\(index)") }) {
            Color(.red).frame(width: 200, height: 200)
          }.buttonStyle(CardButtonStyle())
        }
      }
    }
  }
}

struct GridView: View {
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical) {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
          ForEach((0...100).map { _ in UniqItem() }, id: \.id) { index in
            Button(action: { print("\(index)") }) {
              Text("index: \(index.id)")
                .frame(minWidth: 200, minHeight: 200)
            }.background(Color(.red))
            .buttonStyle(CardButtonStyle())
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
