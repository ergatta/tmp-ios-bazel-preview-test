//
//  GameError.swift
//  Swordle
//
//  Created by Prasanna Swaminathan on 3/2/22.
//

import Foundation

enum GameError : Error {
    case invalidLengthError(size: Int)
    case finished
}
