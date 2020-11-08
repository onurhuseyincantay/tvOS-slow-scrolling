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

struct ListView: View {
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(0...100, id: \.self) { _ in
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
                ForEach(0...100, id: \.self) { index in
                    Button(action: { print("\(index)") }) {
                        Color.red.frame(width: 100, height: 100)
                    }.buttonStyle(CardButtonStyle())
                }
            }
        }
    }
}

struct GridView: View {
    
    var body: some View {
        LazyVStack {
            ForEach(0...100, id: \.self) {
                Text("\($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
