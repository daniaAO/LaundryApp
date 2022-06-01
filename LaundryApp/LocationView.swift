//
//  LocationView.swift
//  LaundryApp
//
//  Created by Dania Alogla on 22/10/1443 AH.
//
import SwiftUI
import MapKit
import CoreLocationUI
import CoreLocation



struct LocationView: View {
    @StateObject var locationManager = LocationManager()

        var body: some View {
            VStack {
                if let location = locationManager.location {
                    Text("Your location: \(location.latitude), \(location.longitude)")
                }

                LocationButton {
                    locationManager.requestLocation()
                }
                .frame(height: 44)
                .padding()
            }
        }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
    }
}


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
}

