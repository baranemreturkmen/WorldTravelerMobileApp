//
//  WorldTravelerApp.swift
//  WorldTraveler
//
//  Created by Baran Emre Türkmen on 16.08.2022.
//

import SwiftUI

@main
struct WorldTravelerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView().tabItem{
                    HStack{
                        Image(systemName: "thermometer")
                        Text("TAB_CONVERSION")
                    }
                }
                MapView().tabItem{
                    HStack{
                        Image(systemName: "map")
                        Text("TAB_MAP")
                    }
                }
            }.accentColor(.purple)
        }
    }
}
