//
//  EventsListSCreen.swift
//  MixKit
//
//  Created by Fabio Giannelli on 27/09/23.
//

import SwiftUI
import Shimmer

struct EventsListScreen: View {
    
    @ObservedObject var eventsViewModel = EventsViewModel()
    
    var body: some View {
        List {
            switch eventsViewModel.events.result {
            case .success:
                ForEach(eventsViewModel.events.data) { event in
                    Text(event.title)
                }
            default:
                ForEach(0..<3) { _ in
                    Text("Loading...")
                        .shimmering(active: !(eventsViewModel.events.result == DataResult.success))
                }
            }
            
        }.onAppear {
            Task {
                await eventsViewModel.getEvents()
            }
        }
    }
}

struct EventsListSCreen_Previews: PreviewProvider {
    static var previews: some View {
        EventsListScreen()
    }
}
