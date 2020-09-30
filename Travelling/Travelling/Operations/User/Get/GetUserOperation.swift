//
//  GetUserOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

import Foundation

class GetUserOperation: DataTaskOperation<GetUserOperationModels.Response> {
    override func main() {
        DispatchQueue.global().async {
            guard let url = "user".jsonURL() else {
                self.noDataAvailableErrorBlock()
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let value = try decoder.decode(User.self, from: data)
                let response = GetUserOperationModels.Response(user: value)
                self.successfulResultBlock(value: response)
            } catch {
                self.noDataAvailableErrorBlock()
            }
        }
    }
}
