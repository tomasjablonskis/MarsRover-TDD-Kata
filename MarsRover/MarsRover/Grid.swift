//
//  Grid.swift
//  MarsRover
//
//  Created by Tomas Jablonskis on 2021-02-23.
//

import Foundation

public struct Grid {
    let topRightCoordinate: Coordinate
    let obstacles: [Coordinate]

    public init(topRightCoordinate: Coordinate, obstacles: [Coordinate] = []) {
        self.topRightCoordinate = topRightCoordinate
        self.obstacles = obstacles
    }

    public var xEdge: Int {
        topRightCoordinate.x
    }

    public var yEdge: Int {
        topRightCoordinate.y
    }

    public func isObstacle(inCoordinate coordinate: Coordinate) -> Bool {
        obstacles.contains(coordinate)
    }
}
