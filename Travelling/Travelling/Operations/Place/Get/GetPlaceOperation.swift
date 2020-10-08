//
//  GetPlaceOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//

import Foundation

class GetPlaceOperation: DataTaskOperation<GetPlaceOperationModels.Response> {
    override func main() {
        DispatchQueue.global().async {
            guard let url = "place".jsonURL() else {
                self.noDataAvailableErrorBlock()
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let value = try decoder.decode(Place.self, from: data)
                let response = GetPlaceOperationModels.Response(place: value)
                self.successfulResultBlock(value: response)
            } catch {
                self.noDataAvailableErrorBlock()
            }
        }
    }
}
