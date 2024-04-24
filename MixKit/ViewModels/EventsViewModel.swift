//
//  EventsViewModel.swift
//  MixKit
//
//  Created by Fabio Giannelli on 28/09/23.
//

import SwiftUI

class EventsViewModel: BaseViewModel {
    
    @Published var events: Response<[Event]> = (.idle, [])
    
    @MainActor
    func getEvents() async {
        await get(endpoint: .events, publishedResponse: &events)
    }
}
