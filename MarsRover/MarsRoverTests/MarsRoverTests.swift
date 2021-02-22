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

    func test_init_throwsErrorOnOutOfBoundsInitialCoordinate() {
        let testCases = [Coordinate(x: -1, y: 0),
                         Coordinate(x: 0, y: -1),
                         Coordinate(x: -1, y: -1),
                         Coordinate(x: 1, y: 0),
                         Coordinate(x: 0, y: 1),
                         Coordinate(x: 1, y: 1)]

        testCases.forEach { invalidInitialCoordinate in
            let grid = Grid(topRightCoordinate: Coordinate(x: 0, y: 0))

            XCTAssertNil(try? Rover(coordinate: invalidInitialCoordinate, direction: .north, grid: grid))
        }
    }

    func test_moveForwardNorth_incrementsYCoordinate() {
        let initialCoordinate = Coordinate(x: 0, y: 0)

        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .north, toMoveTo: Coordinate(x: 0, y: 1), withCommands: "F")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .north, toMoveTo: Coordinate(x: 0, y: 2), withCommands: "FF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .north, toMoveTo: Coordinate(x: 0, y: 3), withCommands: "FFF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .north, toMoveTo: Coordinate(x: 0, y: 4), withCommands: "FFFF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .north, toMoveTo: Coordinate(x: 0, y: 5), withCommands: "FFFFF")
    }

    func test_moveBackwardNorth_decrementsYCoordinate() {
        let initialCoordinate = Coordinate(x: 0, y: 5)

        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .north, toMoveTo: Coordinate(x: 0, y: 4), withCommands: "B")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .north, toMoveTo: Coordinate(x: 0, y: 3), withCommands: "BB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .north, toMoveTo: Coordinate(x: 0, y: 2), withCommands: "BBB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .north, toMoveTo: Coordinate(x: 0, y: 1), withCommands: "BBBB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .north, toMoveTo: Coordinate(x: 0, y: 0), withCommands: "BBBBB")
    }

    func test_moveForwardEast_incrementsXCoordinate() {
        let initialCoordinate = Coordinate(x: 0, y: 0)

        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .east, toMoveTo: Coordinate(x: 1, y: 0), withCommands: "F")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .east, toMoveTo: Coordinate(x: 2, y: 0), withCommands: "FF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .east, toMoveTo: Coordinate(x: 3, y: 0), withCommands: "FFF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .east, toMoveTo: Coordinate(x: 4, y: 0), withCommands: "FFFF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .east, toMoveTo: Coordinate(x: 5, y: 0), withCommands: "FFFFF")
    }

    func test_moveBackwardEast_decrementsXCoordinate() {
        let initialCoordinate = Coordinate(x: 5, y: 0)

        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .east, toMoveTo: Coordinate(x: 4, y: 0), withCommands: "B")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .east, toMoveTo: Coordinate(x: 3, y: 0), withCommands: "BB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .east, toMoveTo: Coordinate(x: 2, y: 0), withCommands: "BBB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .east, toMoveTo: Coordinate(x: 1, y: 0), withCommands: "BBBB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .east, toMoveTo: Coordinate(x: 0, y: 0), withCommands: "BBBBB")
    }

    func test_moveForwardSouth_decrementsYCoordinate() {
        let initialCoordinate = Coordinate(x: 0, y: 5)

        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .south, toMoveTo: Coordinate(x: 0, y: 4), withCommands: "F")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .south, toMoveTo: Coordinate(x: 0, y: 3), withCommands: "FF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .south, toMoveTo: Coordinate(x: 0, y: 2), withCommands: "FFF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .south, toMoveTo: Coordinate(x: 0, y: 1), withCommands: "FFFF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .south, toMoveTo: Coordinate(x: 0, y: 0), withCommands: "FFFFF")
    }

    func test_moveBackwardSouth_incrementsYCoordinate() {
        let initialCoordinate = Coordinate(x: 0, y: 0)

        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .south, toMoveTo: Coordinate(x: 0, y: 1), withCommands: "B")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .south, toMoveTo: Coordinate(x: 0, y: 2), withCommands: "BB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .south, toMoveTo: Coordinate(x: 0, y: 3), withCommands: "BBB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .south, toMoveTo: Coordinate(x: 0, y: 4), withCommands: "BBBB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .south, toMoveTo: Coordinate(x: 0, y: 5), withCommands: "BBBBB")
    }

    func test_moveForwardWest_decrementsXCoordinate() {
        let initialCoordinate = Coordinate(x: 5, y: 0)

        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .west, toMoveTo: Coordinate(x: 4, y: 0), withCommands: "F")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .west, toMoveTo: Coordinate(x: 3, y: 0), withCommands: "FF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .west, toMoveTo: Coordinate(x: 2, y: 0), withCommands: "FFF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .west, toMoveTo: Coordinate(x: 1, y: 0), withCommands: "FFFF")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .west, toMoveTo: Coordinate(x: 0, y: 0), withCommands: "FFFFF")
    }

    func test_moveBackwardWest_incrementsXCoordinate() {
        let initialCoordinate = Coordinate(x: 0, y: 0)

        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .west, toMoveTo: Coordinate(x: 1, y: 0), withCommands: "B")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .west, toMoveTo: Coordinate(x: 2, y: 0), withCommands: "BB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .west, toMoveTo: Coordinate(x: 3, y: 0), withCommands: "BBB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .west, toMoveTo: Coordinate(x: 4, y: 0), withCommands: "BBBB")
        expectRover(withInitialCoordinate: initialCoordinate, andDirection: .west, toMoveTo: Coordinate(x: 5, y: 0), withCommands: "BBBBB")
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

    func test_moveForwardNorth_resetsYOnGridEdgeSurpassed() {
        let grid = Grid(topRightCoordinate: Coordinate(x: 10, y: 10))
        let initialCoordinate = Coordinate(x: 0, y: 10)
        let direction: Rover.Direction = .north
        let sut = makeSUT(coordinate: initialCoordinate, direction: direction, grid: grid)

        sut.move(commands: "F")

        XCTAssertEqual(sut.coordinate, Coordinate(x: 0, y: 0))
    }

    func test_moveForwardSouth_resetsYOnGridEdgeSurpassed() {
        let grid = Grid(topRightCoordinate: Coordinate(x: 10, y: 10))
        let initialCoordinate = Coordinate(x: 0, y: 0)
        let direction: Rover.Direction = .south
        let sut = makeSUT(coordinate: initialCoordinate, direction: direction, grid: grid)

        sut.move(commands: "F")

        XCTAssertEqual(sut.coordinate, Coordinate(x: 0, y: grid.yEdge))
    }

    func test_moveForwardEast_resetsXOnGridEdgeSurpassed() {
        let grid = Grid(topRightCoordinate: Coordinate(x: 10, y: 10))
        let initialCoordinate = Coordinate(x: 10, y: 0)
        let direction: Rover.Direction = .east
        let sut = makeSUT(coordinate: initialCoordinate, direction: direction, grid: grid)

        sut.move(commands: "F")

        XCTAssertEqual(sut.coordinate, Coordinate(x: 0, y: 0))
    }

    func test_moveForwardWest_resetsXOnGridEdgeSurpassed() {
        let grid = Grid(topRightCoordinate: Coordinate(x: 10, y: 10))
        let initialCoordinate = Coordinate(x: 0, y: 0)
        let direction: Rover.Direction = .west
        let sut = makeSUT(coordinate: initialCoordinate, direction: direction, grid: grid)

        sut.move(commands: "F")

        XCTAssertEqual(sut.coordinate, Coordinate(x: grid.xEdge, y: 0))
    }
}

private extension MarsRoverTests {
    func makeSUT(coordinate: Coordinate = Coordinate(x: 0, y: 0), direction: Rover.Direction = .east, grid: Grid = Grid(topRightCoordinate: Coordinate(x: 10, y: 10))) -> Rover {
        return try! Rover(coordinate: coordinate, direction: direction, grid: grid)
    }

    func expectRover(withInitialCoordinate initialCoordinate: Coordinate, andDirection initialDirection: Rover.Direction, toMoveTo expectedCoordinate: Coordinate, withCommands commands: String, file: StaticString = #file, line: UInt = #line) {
        let sut = makeSUT(coordinate: initialCoordinate, direction: initialDirection)

        sut.move(commands: commands)

        XCTAssertEqual(sut.coordinate, expectedCoordinate, file: file, line: line)
    }

    func expectRover(withInitialDirection: Rover.Direction, toTurnTo expectedDirection: Rover.Direction, withCommands commands: String, file: StaticString = #file, line: UInt = #line) {
        let sut = makeSUT(direction: withInitialDirection)

        sut.move(commands: commands)

        XCTAssertEqual(sut.direction, expectedDirection, file: file, line: line)
    }
}
