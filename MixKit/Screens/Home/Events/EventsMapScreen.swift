//
//  EventsMapScreen.swift
//  MixKit
//
//  Created by Fabio Giannelli on 27/09/23.
//

import SwiftUI
import MapKit

struct EventsMapScreen: View {
    
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40, longitude: 40), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
    }
}

struct EventsMapScreen_Previews: PreviewProvider {
    static var previews: some View {
        EventsMapScreen()
    }
}
