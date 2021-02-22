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
        let rover = makeSUT(coordinate: initialCoordinate, direction: initialDirection)

        XCTAssertEqual(rover.coordinate, initialCoordinate)
        XCTAssertEqual(rover.direction, initialDirection)
    }

    func test_moveForwardNorth_incrementsYCoordinate() {
        let expectedCoordinate = Coordinate(x: 0, y: 1)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: "N")

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "F")
    }

    func test_moveForwardTwiceNorth_incrementsYCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 2)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: "N")

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "FF")
    }

    func test_moveBackwardNorth_decrementsYCoordinate() {
        let expectedCoordinate = Coordinate(x: 0, y: 1)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 2), direction: "N")

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "B")
    }
}

private extension MarsRoverTests {
    func makeSUT(coordinate: Coordinate = Coordinate(x: 0, y: 0), direction: String = "E") -> Rover {
        return Rover(coordinate: coordinate, direction: direction)
    }

    func expect(sut: Rover, toMoveTo coordinate: Coordinate, withCommand command: String, file: StaticString = #file, line: UInt = #line) {
        sut.move(command: command)

        XCTAssertEqual(sut.coordinate, coordinate, file: file, line: line)
    }
}
