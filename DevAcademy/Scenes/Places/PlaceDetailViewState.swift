import SwiftUI

struct PlaceDetailViewState: DynamicProperty {
    private let feature: Feature
    
    init(feature: Feature) {
            self.feature = feature
        }
    
    var placesName: String {
        feature.properties.nazev
    }
    
    var placesImage: URL {
        feature.properties.obrId1
    }
}
