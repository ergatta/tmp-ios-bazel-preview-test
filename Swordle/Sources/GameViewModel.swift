//
//  GameViewModel.swift
//  Swordle
//
//  Created by Prasanna Swaminathan on 2/14/22.
//

import Foundation

class GameViewModel {
    let word: Array<Character>
    init(withWord word: Array<Character>) {
        self.word = word
        self.guesses = []
        self.results = []
    }
    
    var guesses: [Array<Character>]
    var results: [Array<GuessResult>]
    
    func submitGuess(guess: Array<Character>) throws {
        if (guess.count != word.count) {
            throw GameError.invalidLengthError(size: guess.count)
        }
        if guess.elementsEqual(word) {
            throw GameError.finished
        }
        guesses.append(guess)
        let guessResults = zip(guess, word).map { (guessChar, wordChar) -> GuessResult in
            let result: GuessResult
            switch (guessChar) {
            case wordChar:
                result = GuessResult.correct
            case let x where word.contains(x):
                result = GuessResult.inWord
            default:
                result = GuessResult.incorrect
            }
            return result
        }
        results.append(guessResults)
    }
    
    enum GuessResult {
        case incorrect
        case inWord
        case correct
    }
}
