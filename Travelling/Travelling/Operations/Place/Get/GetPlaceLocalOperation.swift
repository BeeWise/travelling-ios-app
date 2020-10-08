//
//  GetPlaceLocalOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//

import Foundation

class GetPlaceLocalOperation: DataTaskOperation<GetPlaceOperationModels.Response> {
    var shouldFail: Bool = false
    var delay: Int = Int.random(in: 1000 ... 3000)
    
    override func main() {
        if self.shouldCancelOperation() {
            return
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(self.delay)) {
            if self.shouldCancelOperation() {
                return
            }
            if self.shouldFail {
                self.noDataAvailableErrorBlock()
            } else {
                if let model = self.model as? GetPlaceOperationModels.Request, let placeId = model.placeId {
                    self.successfulResultBlock(value: GetPlaceOperationModels.Response(place: self.place(id: placeId)))
                } else {
                    self.noDataAvailableErrorBlock()
                }
            }
        }
    }
    
    private func place(id: String) -> Place {
        let place = Place(id: id, location: Location(id: "locationId", latitude: 20, longitude: 20))
        place.name = "Name"
        place.commentCount = 20
        place.createdAt = "2013-09-12T09:14:16Z"
        place.description = "Description"
        return place
    }
}
