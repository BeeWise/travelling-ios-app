//
//  GetPlacesLocalOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

class GetPlacesLocalOperation: DataTaskOperation<GetPlacesOperationModels.Response> {
    var shouldFail: Bool = false
    var delay: Int = Int.random(in: 1000 ... 3000)
    var count: Int = Int.random(in: 25 ... 100)
    
    override func main() {
        if self.shouldCancelOperation() {
            return
        }
        
        guard let model = self.model as? GetPlacesOperationModels.Request else {
            self.noDataAvailableErrorBlock()
            return
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(self.delay)) {
            if self.shouldCancelOperation() {
                return
            }
            if self.shouldFail {
                self.noDataAvailableErrorBlock()
            } else {
                let response = GetPlacesOperationModels.Response(places: self.randomPlaces(), page: model.page, limit: model.limit)
                self.successfulResultBlock(value: response)
            }
        }
    }
    
    private func randomPlaces() -> [Place] {
        var items: [Place] = []
        for i in 0..<self.count {
            items.append(self.randomPlace(i: i))
        }
        return items
    }
    
    private func randomPlace(i: Int) -> Place {
        let location = Location(id: UUID().uuidString, latitude: Double(i), longitude: Double(i))
        location.city = "City \(i)"
        location.country = "Country \(i)"
        let place = Place(id: UUID().uuidString, location: location)
        place.name = "Name \(i)"
        return place
    }
}
