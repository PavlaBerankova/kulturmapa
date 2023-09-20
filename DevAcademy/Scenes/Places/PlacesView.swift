import SwiftUI
import ActivityIndicatorView

struct PlacesView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = PlacesViewModel()

    // MARK: BODY
    var body: some View {
        NavigationStack {
            Group {
                if model.placesAreFetched {
                    customToolbar
                    if model.buttonKind == "Vše" {
                        List(model.places, id: \.attributes.ogcFid) { place in
                            NavigationLink {
                                coordinator.placeDetailScene(with: place)
                            } label: {
                                PlacesRow(place: place)
                            }
                        }
                    } else {
                        List(model.placesFilter(with: model.buttonKind), id: \.attributes.ogcFid) { place in
                            NavigationLink {
                                coordinator.placeDetailScene(with: place)
                            } label: {
                                PlacesRow(place: place)
                            }
                        }
                    }
                } else {
                    VStack {
                        ActivityIndicatorView(isVisible: .constant(true), type: .arcs(count: 3, lineWidth: 1.5))
                            .foregroundColor(Color.theme.accent)
                            .frame(width: 150, height: 150)
                    }
                }
            }
            .listStyle(.plain)
        }
        .task {
            await model.fetchData()
        }
    }
}

extension PlacesView {
    private var customToolbar: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                        model.buttonKind = "Vše"
                    } label: {
                        TypeButtonInToolbar(title: "Vše", isSelected: model.buttonKind == "Vše")
                    }
                    ForEach(Kind.allCases, id: \.self) { kind in
                        Button {
                            model.buttonKind = kind.rawValue
                        } label: {
                            TypeButtonInToolbar(title: kind.rawValue, isSelected: model.buttonKind == kind.rawValue)
                        }
                    }
                }
                .padding(5)
            }
        }
        .padding(.horizontal)
        .background(
        RoundedRectangle(cornerRadius: 0)
            .ignoresSafeArea(edges: .top)
            .foregroundColor(Color.theme.search)
            .shadow(color: Color.theme.secondaryTextColor, radius: 2)
        )
    }
}

// MARK: PREVIEW
struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
            .environmentObject(Coordinator())
    }
}
