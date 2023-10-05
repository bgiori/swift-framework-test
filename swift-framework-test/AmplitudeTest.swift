//
//  Test.swift
//  swift-framework-test
//
//  Created by Brian Giori on 10/5/23.
//

import Foundation
import Amplitude
import AmplitudeExperiment

let analyticsKey = "TODO"
let deploymentKey = "TODO"

class AmplitudeTest {
    let analytics: Amplitude
    let experiment: ExperimentClient
    init() {
        self.analytics = Amplitude.instance()
        // Make the test work better by not batching events.
        self.analytics.eventUploadThreshold = 1
        self.analytics.initializeApiKey(analyticsKey)
        self.experiment = Experiment.initializeWithAmplitudeAnalytics(apiKey: deploymentKey, config: ExperimentConfigBuilder().debug(true).build())
    }
}
