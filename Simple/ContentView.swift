//
//  ContentView.swift
//  Simple
//
//  Created by Philipp on 02.07.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            .frame(minWidth: 400, minHeight: 400)
            .navigationTitle("Simple")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
