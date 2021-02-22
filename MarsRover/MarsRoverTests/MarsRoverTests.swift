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
        expectRover(withInitialDirection: .north, toTurnTo: .east, withCommands: "R")
        expectRover(withInitialDirection: .north, toTurnTo: .south, withCommands: "RR")
        expectRover(withInitialDirection: .north, toTurnTo: .west, withCommands: "RRR")
        expectRover(withInitialDirection: .north, toTurnTo: .north, withCommands: "RRRR")
        expectRover(withInitialDirection: .north, toTurnTo: .east, withCommands: "RRRRR")
    }

    func test_moveRightEast_changesDirectionClockwise() {
        expectRover(withInitialDirection: .east, toTurnTo: .south, withCommands: "R")
        expectRover(withInitialDirection: .east, toTurnTo: .west, withCommands: "RR")
        expectRover(withInitialDirection: .east, toTurnTo: .north, withCommands: "RRR")
        expectRover(withInitialDirection: .east, toTurnTo: .east, withCommands: "RRRR")
        expectRover(withInitialDirection: .east, toTurnTo: .south, withCommands: "RRRRR")
    }

    func test_moveRightSouth_changesDirectionClockwise() {
        expectRover(withInitialDirection: .south, toTurnTo: .west, withCommands: "R")
        expectRover(withInitialDirection: .south, toTurnTo: .north, withCommands: "RR")
        expectRover(withInitialDirection: .south, toTurnTo: .east, withCommands: "RRR")
        expectRover(withInitialDirection: .south, toTurnTo: .south, withCommands: "RRRR")
        expectRover(withInitialDirection: .south, toTurnTo: .west, withCommands: "RRRRR")
    }

    func test_moveRightWest_changesDirectionClockwise() {
        expectRover(withInitialDirection: .west, toTurnTo: .north, withCommands: "R")
        expectRover(withInitialDirection: .west, toTurnTo: .east, withCommands: "RR")
        expectRover(withInitialDirection: .west, toTurnTo: .south, withCommands: "RRR")
        expectRover(withInitialDirection: .west, toTurnTo: .west, withCommands: "RRRR")
        expectRover(withInitialDirection: .west, toTurnTo: .north, withCommands: "RRRRR")
    }

    func test_moveLeftNorth_changesDirectionCounterClockwise() {
        expectRover(withInitialDirection: .north, toTurnTo: .west, withCommands: "L")
        expectRover(withInitialDirection: .north, toTurnTo: .south, withCommands: "LL")
        expectRover(withInitialDirection: .north, toTurnTo: .east, withCommands: "LLL")
        expectRover(withInitialDirection: .north, toTurnTo: .north, withCommands: "LLLL")
        expectRover(withInitialDirection: .north, toTurnTo: .west, withCommands: "LLLLL")
    }

    func test_moveLeftEast_changesDirectionCounterClockwise() {
        expectRover(withInitialDirection: .east, toTurnTo: .north, withCommands: "L")
        expectRover(withInitialDirection: .east, toTurnTo: .west, withCommands: "LL")
        expectRover(withInitialDirection: .east, toTurnTo: .south, withCommands: "LLL")
        expectRover(withInitialDirection: .east, toTurnTo: .east, withCommands: "LLLL")
        expectRover(withInitialDirection: .east, toTurnTo: .north, withCommands: "LLLLL")
    }

    func test_moveLeftSouth_changesDirectionCounterClockwise() {
        expectRover(withInitialDirection: .south, toTurnTo: .east, withCommands: "L")
        expectRover(withInitialDirection: .south, toTurnTo: .north, withCommands: "LL")
        expectRover(withInitialDirection: .south, toTurnTo: .west, withCommands: "LLL")
        expectRover(withInitialDirection: .south, toTurnTo: .south, withCommands: "LLLL")
        expectRover(withInitialDirection: .south, toTurnTo: .east, withCommands: "LLLLL")
    }

    func test_moveLeftWest_changesDirectionCounterClockwise() {
        expectRover(withInitialDirection: .west, toTurnTo: .south, withCommands: "L")
        expectRover(withInitialDirection: .west, toTurnTo: .east, withCommands: "LL")
        expectRover(withInitialDirection: .west, toTurnTo: .north, withCommands: "LLL")
        expectRover(withInitialDirection: .west, toTurnTo: .west, withCommands: "LLLL")
        expectRover(withInitialDirection: .west, toTurnTo: .south, withCommands: "LLLLL")
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

    func expectRover(withInitialDirection: Rover.Direction, toTurnTo expectedDirection: Rover.Direction, withCommands commands: String, file: StaticString = #file, line: UInt = #line) {
        let sut = makeSUT(direction: withInitialDirection)

        sut.move(commands: commands)

        XCTAssertEqual(sut.direction, expectedDirection, file: file, line: line)
    }
}
