//
//  EventsScree.swift
//  MixKit
//
//  Created by Fabio Giannelli on 27/09/23.
//

import SwiftUI

struct EventsScreen: View {
    
    @State var screenSelection: Int = 0
    
    var body: some View {
        MVView {
            VStack {
                Picker("What is your favorite color?", selection: $screenSelection) {
                    Text("Map").tag(0)
                    Text("List").tag(1)
                }
                .pickerStyle(.segmented)

                switch screenSelection {
                case 0:
                    EventsMapScreen()
                case 1:
                    EventsListScreen()
                default:
                    EventsMapScreen()
                }
            }
        }
    }
}

struct EventScreen_Preview: PreviewProvider {
    static var previews: some View {
        EventsScreen()
    }
}
