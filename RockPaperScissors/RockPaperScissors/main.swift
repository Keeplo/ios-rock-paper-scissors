//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Result:CustomStringConvertible {
    case win
    case lose
    case draw
    case error
    case exit

    static func decideRockPaperScissorsResult(defense: Hand, offense: Hand) -> Result {
        switch (defense, offense) {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return .win
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            return .lose
        default:
            return .draw
        }
    }
    static func decideMookJjeeBbaResult(defense: Hand, offense: Hand) -> Result {
        switch (defense, offense) {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return .draw
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            return .lose
        default:
            return .win
        }
    }
    
    var description: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        default:
            return "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}

enum Hand: Int {
    case inputExit = 0
    case scissors
    case rock
    case paper
    case inputError
    
    func changeRockAndScissors() -> Hand {
        if self == .rock {
            return .scissors
        } else if self == .scissors {
            return .rock
        } else {
            return self
        }
    }
}

enum Turn: CustomStringConvertible {
    case userAttack
    case computerAttack
    
    func swapTurn() -> Turn {
        return ( self == .userAttack ? .computerAttack : .userAttack )
    }
    var description: String {
        return ( self == .userAttack ? "사용자" : "컴퓨터" )
    }
}

func userInputNumber(_ alertMessage: String) -> Int {
    print(alertMessage, terminator: "")
    if let userInput = readLine(), let convertNumber = Int(userInput), (0...3).contains(convertNumber) {
        return convertNumber
    } else {
        print(Result.error.description)
        return Hand.inputError.rawValue
    }
}

func makeRandomNumber() -> Int {
    return Int.random(in:1...3)
}

func decideResultDependsOnTurns(_ currentTurn: Turn, user userHand: Hand, computer computerHand: Hand) -> Result {
    switch currentTurn {
    case .userAttack:
        return Result.decideMookJjeeBbaResult(defense: computerHand, offense: userHand)
    case .computerAttack:
        return Result.decideMookJjeeBbaResult(defense: userHand, offense: computerHand)
    }
}

func playRockPaperScissors() -> Result {
    let rockPaperScissorsMessage = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    guard let userHand = Hand(rawValue: userInputNumber(rockPaperScissorsMessage)) else { return .error }
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else { return .error }

    if userHand == .inputExit {
        return .exit
    } else if userHand == .inputError {
        return .error
    }
    
    let gameResult = Result.decideRockPaperScissorsResult(defense: computerHand, offense: userHand)
    print(gameResult.description)

    return gameResult
}

func playMookJjeeBba(_ currentTurn: inout Turn) -> Bool {
    let mookJjeeBbaMessage = " 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    guard var userHand = Hand(rawValue: userInputNumber("[\(currentTurn.description) 턴]" + mookJjeeBbaMessage)) else { return true }
    userHand = userHand.changeRockAndScissors()
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else { return true }
    
    if userHand == .inputExit {
        return false
    } else if userHand == .inputError {
        currentTurn = .computerAttack
        return true
    }
        
    let mookJjeeBbaResult: Result = decideResultDependsOnTurns(currentTurn, user: userHand, computer: computerHand)
    if mookJjeeBbaResult == .win {
        print("\(currentTurn.description)의 승리!")
        return false
    } else if mookJjeeBbaResult == .lose {
        currentTurn = currentTurn.swapTurn()
    } else if mookJjeeBbaResult == .error {
        currentTurn = .computerAttack
    }
    print("\(currentTurn.description)의 턴입니다!")
    return true
}

func mookJjeeBbaGame() -> Bool {
    let rockPaperScissorsResult = playRockPaperScissors()
    
    switch rockPaperScissorsResult {
    case .error, .draw :
        return true
    case .exit:
        return false
    default:
        var currentTurn: Turn = ( rockPaperScissorsResult == .win ? .userAttack : .computerAttack )
        while true {
            if !playMookJjeeBba(&currentTurn) { return false }
        }
    }
}

// Main
func console() {
    while true {
        if !mookJjeeBbaGame() { break }
    }
    print("게임 종료")
}

console()
