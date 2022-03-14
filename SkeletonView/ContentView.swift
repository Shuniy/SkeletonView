//
//  ContentView.swift
//  SkeletonView
//
//  Created by Shubham Kumar on 07/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "cloud")
                .resizable()
                .clipShape(Circle())
                .font(.system(size: 32))
            Text("Hello")
        }
        .redacted(reason: .placeholder)
        .shimmering(duration: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
