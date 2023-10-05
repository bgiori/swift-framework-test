//
//  swift_framework_testTests.swift
//  swift-framework-testTests
//
//  Created by Brian Giori on 10/5/23.
//

import XCTest
@testable import swift_framework_test

final class AmplitudeTestTests: XCTestCase {

    func test() throws {
        let amplitude = AmplitudeTest()
        let s = DispatchSemaphore(value: 0)
        amplitude.experiment.fetch(user: nil) { _, _ in
            print(amplitude.experiment.all())
            _ = amplitude.experiment.variant("TODO")
            s.signal()
        }
        s.wait()
        // Wait for exposure to be sent
        _ = s.wait(timeout: .now() + .seconds(5))
    }
}
