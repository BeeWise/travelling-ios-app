//
//  GetPlaceCommentsLocalOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/10/2020.
//

import Foundation

class GetPlaceCommentsLocalOperation: DataTaskOperation<GetPlaceCommentsOperationModels.Response> {
    var shouldFail: Bool = false
    var delay: Int = Int.random(in: 1000 ... 3000)
    var count: Int = Int.random(in: 25 ... 100)
    
    override func main() {
        if self.shouldCancelOperation() {
            return
        }
        
        guard let model = self.model as? GetPlaceCommentsOperationModels.Request else {
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
                let response = GetPlaceCommentsOperationModels.Response(comments: self.randomComments(), page: model.page, limit: model.limit)
                self.successfulResultBlock(value: response)
            }
        }
    }
    
    private func randomComments() -> [Comment] {
        var items: [Comment] = []
        for i in 0..<self.count {
            items.append(self.randomComment(i: i))
        }
        return items
    }
    
    private func randomComment(i: Int) -> Comment {
        let comment = Comment(id: UUID().uuidString)
        comment.createdAt = "2018-11-01T21:10:56Z"
        comment.text = "Text \(i)"
        comment.user = User(id: "\(i)")
        return comment
    }
}
