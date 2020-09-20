//
//  GetImageOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation
import UIKit

class GetImageOperation: DataTaskOperation<UIImage?> {
    override func main() {
        DispatchQueue.global().async {
            guard let model = self.model as? GetImageOperationModels.Request else {
                self.noDataAvailableErrorBlock()
                return
            }
            let image = model.imageName?.literalImage()
            self.successfulResultBlock(value: image)
        }
    }
}
