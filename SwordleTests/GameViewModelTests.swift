//
//  GameViewModelTests.swift
//  SwordleTests
//
//  Created by Prasanna Swaminathan on 3/2/22.
//

import XCTest
@testable import Swordle

class GameViewModelTests: XCTestCase {

    func testThrows() throws {
        let vm = GameViewModel(withWord: Array("realm"))
        XCTAssertThrowsError(try vm.submitGuess(guess: Array("toomanyletters")), "should throw too many letters")
        XCTAssertThrowsError(try vm.submitGuess(guess: Array("realm")), "should throw finished")
    }
    
    func testSubmitGuess() {
        let vm = GameViewModel(withWord: Array("realm"))
        try? vm.submitGuess(guess: Array("raise"))
        XCTAssert(vm.guesses.elementsEqual([Array("raise")]), "guesses don't match.")
        XCTAssert(vm.results.elementsEqual([Array([
            GameViewModel.GuessResult.correct,
            GameViewModel.GuessResult.inWord,
            GameViewModel.GuessResult.incorrect,
            GameViewModel.GuessResult.incorrect,
            GameViewModel.GuessResult.inWord
        ])]), "results don't match")
    }

}
