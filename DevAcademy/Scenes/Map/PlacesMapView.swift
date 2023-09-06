//  Brno - 49.19522264287748, 16.605414965101804
import SwiftUI
import MapKit

struct PlacesMapView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var locationManager: LocationManager
    let model = PlacesViewModel()

    // MARK: BODY
    var body: some View {
        NavigationStack {
            ZStack {
                if model.buttonKind == "Vše" {
                    mapViewWithAnnotations
                } else {
                    mapViewWithAnnotationsFilter
                }
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

// MARK: EXTENSION
extension PlacesMapView {
    private var customToolbar: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                        model.buttonKind = "Vše"
                    } label: {
                        KindButtonInToolbar(title: "Vše", isSelected: model.buttonKind == "Vše")
                    }
                    ForEach(Kind.allCases, id: \.self) { kind in
                        Button {
                            model.buttonKind = kind.rawValue
                        } label: {
                            KindButtonInToolbar(title: kind.rawValue, isSelected: model.buttonKind == kind.rawValue)
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
    
    private var mapViewWithAnnotations: some View {
        Map(coordinateRegion: model.$region, showsUserLocation: true, annotationItems: model.places, annotationContent: { place in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(place.geometry?.latitude ?? 0.0), longitude: CLLocationDegrees(place.geometry?.longitude ?? 0.0))) {
                PlaceMapAnnotationView(kindSymbol: place.symbol)
                    .scaleEffect(model.selectedPlace == place ? 1 : 0.7)
                    .animation(.easeInOut)
                    .onTapGesture {
                        model.selectedPlace = place
                    }
            }
        })
        .ignoresSafeArea(edges: .top)
    }
    
    private var mapViewWithAnnotationsFilter: some View {
        Map(coordinateRegion: model.$region, showsUserLocation: true, annotationItems: model.kindFilter(with: model.buttonKind), annotationContent: { place in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(place.geometry?.latitude ?? 0.0), longitude: CLLocationDegrees(place.geometry?.longitude ?? 0.0))) {
                PlaceMapAnnotationView(kindSymbol: place.symbol)
                    .scaleEffect(model.selectedPlace == place ? 1 : 0.7)
                    .animation(.easeInOut)
                    .onTapGesture {
                        model.selectedPlace = place
                    }
            }
        })
        .ignoresSafeArea(edges: .top)
    }
}

// MARK: PREVIEW
struct PlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesMapView()
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
            .environmentObject(Coordinator())
            .environmentObject(LocationManager())
    }
}
