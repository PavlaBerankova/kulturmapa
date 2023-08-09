import SwiftUI
import MapKit

struct PlacesMapViewModel: DynamicProperty {
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 49.19522264287748,
            longitude: 16.605414965101804),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1))
}
