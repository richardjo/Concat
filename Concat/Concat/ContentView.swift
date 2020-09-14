//
//  ContentView.swift
//  Concat
//
//  Created by Richard Jo on 9/14/20.
//  Copyright © 2020 Richard Jo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MatchesView()
                .tabItem {
                    Image(systemName: "person.3")
                        .renderingMode(.original)
                    Text("Matches")
                        .foregroundColor(.black)
            }
            EventsView()
                .tabItem {
                    Image(systemName: "calendar")
                        .renderingMode(.original)
                    Text("Events")
                        .foregroundColor(.black)
            }
            Color.white
                .tabItem {
                    Image(systemName: "gear")
                        .renderingMode(.original)
                    Text("Settings")
                        .foregroundColor(.black)
            }
        }
        .accentColor(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
