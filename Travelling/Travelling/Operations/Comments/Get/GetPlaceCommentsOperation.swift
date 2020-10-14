//
//  GetPlaceCommentsOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/10/2020.
//

import Foundation

class GetPlaceCommentsOperation: DataTaskOperation<GetPlaceCommentsOperationModels.Response> {
    override func main() {
        DispatchQueue.global().async {
            guard let model = self.model as? GetPlaceCommentsOperationModels.Request else {
                self.noDataAvailableErrorBlock()
                return
            }
            guard let url = "comments".jsonURL() else {
                self.noDataAvailableErrorBlock()
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let value = try decoder.decode([Comment].self, from: data)
                let response = GetPlaceCommentsOperationModels.Response(comments: value, page: model.page, limit: model.limit)
                self.successfulResultBlock(value: response)
            } catch {
                self.noDataAvailableErrorBlock()
            }
        }
    }
}
