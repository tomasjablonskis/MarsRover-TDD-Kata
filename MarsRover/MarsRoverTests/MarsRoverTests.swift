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

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "F")
    }

    func test_moveForwardTwiceNorth_incrementsYCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 2)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .north)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "FF")
    }

    func test_moveBackwardNorth_decrementsYCoordinate() {
        let expectedCoordinate = Coordinate(x: 0, y: 1)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 2), direction: .north)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "B")
    }

    func test_moveBackwardNorthTwice_decrementsYCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 2), direction: .north)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "BB")
    }

    func test_moveForwardEast_incrementsXCoordinate() {
        let expectedCoordinate = Coordinate(x: 1, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .east)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "F")
    }

    func test_moveForwardEastTwice_incrementsXCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 2, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .east)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "FF")
    }

    func test_moveBackwardEast_decrementsXCoordinate() {
        let expectedCoordinate = Coordinate(x: 1, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 2, y: 0), direction: .east)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "B")
    }

    func test_moveBackwardEastTwice_decrementsXCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 2, y: 0), direction: .east)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "BB")
    }

    func test_moveForwardSouth_decrementsYCoordinate() {
        let expectedCoordinate = Coordinate(x: 0, y: 1)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 2), direction: .south)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "F")
    }

    func test_moveForwardSouthTwice_decrementsYCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 2), direction: .south)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "FF")
    }

    func test_moveBackwardSouth_incrementsYCoordinate() {
        let expectedCoordinate = Coordinate(x: 0, y: 1)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .south)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "B")
    }

    func test_moveBackwardSouthTwice_incrementsYCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 2)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .south)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "BB")
    }

    func test_moveForwardWest_decrementsXCoordinate() {
        let expectedCoordinate = Coordinate(x: 1, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 2, y: 0), direction: .west)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "F")
    }

    func test_moveForwardWestTwice_decrementsXCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 0, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 2, y: 0), direction: .west)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "FF")
    }

    func test_moveBackwardWest_incrementsXCoordinate() {
        let expectedCoordinate = Coordinate(x: 1, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .west)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "B")
    }

    func test_moveBackwardWestTwice_incrementsXCoordinateTwice() {
        let expectedCoordinate = Coordinate(x: 2, y: 0)
        let sut = makeSUT(coordinate: Coordinate(x: 0, y: 0), direction: .west)

        expect(sut: sut, toMoveTo: expectedCoordinate, withCommands: "BB")
    }

    func test_moveRightNorth_changesDirectionClockwise() {
        expect(initialDirection: .north, toTurnTo: .east, withCommands: "R")
        expect(initialDirection: .north, toTurnTo: .south, withCommands: "RR")
        expect(initialDirection: .north, toTurnTo: .west, withCommands: "RRR")
        expect(initialDirection: .north, toTurnTo: .north, withCommands: "RRRR")
        expect(initialDirection: .north, toTurnTo: .east, withCommands: "RRRRR")
    }

    func test_moveRightEast_changesDirectionClockwise() {
        expect(initialDirection: .east, toTurnTo: .south, withCommands: "R")
        expect(initialDirection: .east, toTurnTo: .west, withCommands: "RR")
        expect(initialDirection: .east, toTurnTo: .north, withCommands: "RRR")
        expect(initialDirection: .east, toTurnTo: .east, withCommands: "RRRR")
        expect(initialDirection: .east, toTurnTo: .south, withCommands: "RRRRR")
    }

    func test_moveRightSouth_changesDirectionClockwise() {
        expect(initialDirection: .south, toTurnTo: .west, withCommands: "R")
        expect(initialDirection: .south, toTurnTo: .north, withCommands: "RR")
        expect(initialDirection: .south, toTurnTo: .east, withCommands: "RRR")
        expect(initialDirection: .south, toTurnTo: .south, withCommands: "RRRR")
        expect(initialDirection: .south, toTurnTo: .west, withCommands: "RRRRR")
    }
}

private extension MarsRoverTests {
    func makeSUT(coordinate: Coordinate = Coordinate(x: 0, y: 0), direction: Rover.Direction = .east) -> Rover {
        return Rover(coordinate: coordinate, direction: direction)
    }

    func expect(sut: Rover, toMoveTo coordinate: Coordinate, withCommands commands: String, file: StaticString = #file, line: UInt = #line) {
        sut.move(commands: commands)

        XCTAssertEqual(sut.coordinate, coordinate, file: file, line: line)
    }

    func expect(sut: Rover, toTurnTo direction: Rover.Direction, withCommands commands: String, file: StaticString = #file, line: UInt = #line) {
        sut.move(commands: commands)

        XCTAssertEqual(sut.direction, direction, file: file, line: line)
    }

    func expect(initialDirection: Rover.Direction, toTurnTo expectedDirection: Rover.Direction, withCommands commands: String, file: StaticString = #file, line: UInt = #line) {
        let sut = makeSUT(direction: initialDirection)

        sut.move(commands: commands)

        XCTAssertEqual(sut.direction, expectedDirection, file: file, line: line)
    }
}
