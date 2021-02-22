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
        let initialDirection: Rover.Direction = .west
        let rover = makeSUT(coordinate: initialCoordinate, direction: initialDirection)

        XCTAssertEqual(rover.coordinate, initialCoordinate)
        XCTAssertEqual(rover.direction, initialDirection)
    }

    func test_moveForwardNorth_incrementsYCoordinate() {
        let expectedCoordinate = Coordinate(x: 0, y: 1)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .north)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "F")
    }

    func test_moveForwardTwiceNorth_incrementsYCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 2)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .north)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "FF")
    }

    func test_moveBackwardNorth_decrementsYCoordinate() {
        let expectedCoordinate = Coordinate(x: 0, y: 1)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 2), direction: .north)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "B")
    }

    func test_moveBackwardNorthTwice_decrementsYCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 2), direction: .north)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "BB")
    }

    func test_moveForwardEast_incrementsXCoordinate() {
        let expectedCoordinate = Coordinate(x: 1, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .east)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "F")
    }

    func test_moveForwardEastTwice_incrementsXCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 2, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .east)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "FF")
    }

    func test_moveBackwardEast_decrementsXCoordinate() {
        let expectedCoordinate = Coordinate(x: 1, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 2, y: 0), direction: .east)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "B")
    }

    func test_moveBackwardEastTwice_decrementsXCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 2, y: 0), direction: .east)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "BB")
    }

    func test_moveForwardSouth_decrementsYCoordinate() {
        let expectedCoordinate = Coordinate(x: 0, y: 1)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 2), direction: .south)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "F")
    }

    func test_moveForwardSouthTwice_decrementsYCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 2), direction: .south)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "FF")
    }

    func test_moveBackwardSouth_incrementsYCoordinate() {
        let expectedCoordinate = Coordinate(x: 0, y: 1)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .south)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "B")
    }

    func test_moveBackwardSouthTwice_incrementsYCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 2)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .south)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "BB")
    }

    func test_moveForwardWest_decrementsXCoordinate() {
        let expectedCoordinate = Coordinate(x: 1, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 2, y: 0), direction: .west)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "F")
    }

    func test_moveForwardWestTwice_decrementsXCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 2, y: 0), direction: .west)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "FF")
    }

    func test_moveBackwardWest_incrementsXCoordinate() {
        let expectedCoordinate = Coordinate(x: 1, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .west)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "B")
    }

    func test_moveBackwardWestTwice_incrementsXCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 2, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .west)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommand: "BB")
    }
}

private extension MarsRoverTests {
    func makeSUT(coordinate: Coordinate = Coordinate(x: 0, y: 0), direction: Rover.Direction = .east) -> Rover {
        return Rover(coordinate: coordinate, direction: direction)
    }

    func expect(sut: Rover, toMoveTo coordinate: Coordinate, withCommand command: String, file: StaticString = #file, line: UInt = #line) {
        sut.move(command: command)

        XCTAssertEqual(sut.coordinate, coordinate, file: file, line: line)
    }
}
