//
//  MarsRoverTests.swift
//  MarsRoverTests
//
//  Created by Tomas Jablonskis on 2021-02-21.
//

import Foundation
import XCTest
import MarsRover

class MarsRoverTests: XCTestCase {

    func test_init_setsInitialValues() {
        let initialCoordinate = Coordinate(x: 0, y: 0)
        let initialDirection = "W"
        let rover = Rover(coordinate: initialCoordinate, direction: initialDirection)

        XCTAssertEqual(rover.coordinate, initialCoordinate)
        XCTAssertEqual(rover.direction, initialDirection)
    }

    func test_moveForwardNorth_incrementsYCoordinate() {
        let expectedCoordinate = Coordinate(x: 0, y: 1)
        let rover = Rover(coordinate: Coordinate(x: 0, y: 0), direction: "N")

        rover.move(command: "F")

        XCTAssertEqual(rover.coordinate, expectedCoordinate)
    }
}
