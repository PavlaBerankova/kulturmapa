import MapKit
import SwiftUI

struct PlacesMapView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var locationManager: LocationManager
    let model = PlacesViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                mapViewWithAnnotations(kind: model.placeKind)
                VStack {
                    customToolbar
                    Spacer()
                }
            }
        }
        .task {
            await model.fetchData()
        }
        .sheet(item: model.$selectedPlace) { place in
            coordinator.placeDetailScene(with: place)
        }
    }
}

// MARK: - EXTENSION
extension PlacesMapView {
    private var customToolbar: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                        model.placeKind = "Vše"
                    } label: {
                        ToolbarButtonWithKindView(title: "Vše", isSelected: model.placeKind == "Vše")
                    }
                    ForEach(Kind.allCases, id: \.self) { kind in
                        Button {
                            model.placeKind = kind.rawValue
                        } label: {
                            ToolbarButtonWithKindView(title: kind.rawValue, isSelected: model.placeKind == kind.rawValue)
                        }
                    }
                }
                .padding(5)
            }
        }
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 3)
                .ignoresSafeArea(edges: .top)
                .foregroundColor(Color.theme.search)
                .shadow(color: Color.theme.secondaryTextColor, radius: 2)
        )
    }

    private func mapViewWithAnnotations(kind: String) -> some View {
        Map(coordinateRegion: model.$region,
            showsUserLocation: true,
            annotationItems: model.placesFilter(with: kind)) { place in
                MapAnnotation(
                    coordinate: CLLocationCoordinate2D(
                        latitude: CLLocationDegrees(place.geometry?.latitude ?? 0.0),
                        longitude: CLLocationDegrees(place.geometry?.longitude ?? 0.0))) {
                            MapWithAnnotationView(kindSymbol: place.symbol)
                                .scaleEffect(model.selectedPlace == place ? 1 : 0.7)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        model.selectedPlace = place
                                    }
                                }
                }
        }
        .ignoresSafeArea(edges: .top)
    }
}

// MARK: - PREVIEW
struct PlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesMapView()
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
            .environmentObject(Coordinator())
            .environmentObject(LocationManager())
    }
}
