//
//  MainViewControllerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

@testable import Travelling
import UIKit

class MainViewControllerSpy: MainViewController {
    var presentCalled: Bool = false
    var dismissCalled: Bool = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presentCalled = true
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismissCalled = true
    }
}
