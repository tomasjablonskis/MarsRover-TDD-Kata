//
//  Coordinate.swift
//  MarsRover
//
//  Created by Tomas Jablonskis on 2021-02-23.
//

import Foundation

public struct Coordinate: Equatable {
    public var x: Int
    public var y: Int

    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
