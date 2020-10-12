//
//  SignUpUserOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation

class SignUpUserOperation: DataTaskOperation<SignUpUserOperationModels.Response> {
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
                let response = SignUpUserOperationModels.Response(user: value)
                self.successfulResultBlock(value: response)
            } catch {
                self.noDataAvailableErrorBlock()
            }
        }
    }
}
