//
//  GetPlacesOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

class GetPlacesOperation: DataTaskOperation<GetPlacesOperationModels.Response> {
    override func main() {
        DispatchQueue.global().async {
            guard let model = self.model as? GetPlacesOperationModels.Request else {
                self.noDataAvailableErrorBlock()
                return
            }
            guard let url = "places".jsonURL() else {
                self.noDataAvailableErrorBlock()
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let value = try decoder.decode([Place].self, from: data)
                let response = GetPlacesOperationModels.Response(places: value, page: model.page, limit: model.limit)
                self.successfulResultBlock(value: response)
            } catch {
                self.noDataAvailableErrorBlock()
            }
        }
    }
}
