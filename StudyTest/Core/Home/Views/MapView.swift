//
//  MapView.swift
//  StudyTest
//
//  Created by Owen Nigel on 19/1/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.2966, longitude: 103.7764), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        VStack{
            Map(coordinateRegion: $region)
                .frame(width: 400, height: 300)
                .ignoresSafeArea()

            Spacer()
        }
    }
}

#Preview {
    MapView()
}
