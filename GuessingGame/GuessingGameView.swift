//
//  GuessingGameView.swift
//  GuessingGame
//
//  WHAT THIS GAME DOES NOW
//  The app picks a random secret whole number from 1 to 100.
//  You choose a guess using the number buttons and click Guess.
//  Wrong guesses tell the player to go higher or lower.
//  The game counts guesses and shows a message, icon, and colour.
//  The game also shows if the secret number is even or odd.
//  It remembers the player's best score.
//  It prevents players from guessing the same number twice.
//  You can play again after finding the number.
//

import SwiftUI

struct GuessingGameView: View {

    let lowestNumber: Int = 1
    let highestNumber: Int = 100

    @State var secretNumber: Int = Int.random(in: 1...100)
    @State var guess: Int = 50
    @State var guessCount: Int = 0
    @State var bestScore: Int = 0
    @State var lastGuess: Int = 0

    @State var message: String = "Make your first guess!"
    @State var messageSymbol: String = "questionmark.circle.fill"
    @State var messageColor: Color = .blue
    @State var gameIsOver: Bool = false

    var body: some View {
        VStack(spacing: 20) {

            Text("Guessing Game")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Guess the secret number between 1 and 100!")
                .font(.subheadline)
                .foregroundColor(.secondary)

            VStack(spacing: 10) {
                Image(systemName: messageSymbol)
                    .font(.system(size: 35))
                    .foregroundColor(messageColor)

                Text(message)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(messageColor)
            }
            .frame(maxWidth: .infinity)
            .padding()

            Text("YOUR GUESS")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.secondary)

            Text("\(guess)")
                .font(.system(size: 55))
                .fontWeight(.bold)

            HStack(spacing: 12) {
                Button("-10") {
                    decreaseGuessByTen()
                }

                Button("-1") {
                    decreaseGuessByOne()
                }

                Button("+1") {
                    increaseGuessByOne()
                }

                Button("+10") {
                    increaseGuessByTen()
                }
            }
            .buttonStyle(.bordered)
            .disabled(gameIsOver)

            VStack(spacing: 8) {
                Text("SECRET NUMBER TYPE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)

                Text(getNumberType(number: secretNumber))
                    .font(.title2)
                    .fontWeight(.bold)

                Text("BEST SCORE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)

                if bestScore == 0 {
                    Text("No record yet")
                        .font(.title3)
                        .fontWeight(.bold)
                } else {
                    Text("\(bestScore) guesses")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            .padding()

            Button(gameIsOver ? "Play Again" : "Guess") {
                if gameIsOver {
                    startNewGame()
                } else {
                    checkGuess()
                }
            }
            .font(.title2)
            .fontWeight(.bold)
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)

            Text("Guesses: \(guessCount)")
                .font(.headline)
                .foregroundColor(.secondary)

        }
        .padding()
        .frame(minWidth: 550, minHeight: 760)
    }

    func checkGuess() {

        if guess == lastGuess {
            message = "You already guessed this number! Try a different number."
            messageSymbol = "exclamationmark.triangle.fill"
            messageColor = .orange
            return
        }

        lastGuess = guess
        guessCount += 1

        if guess == secretNumber {

            message = "Correct! You found the secret number!"
            messageSymbol = "checkmark.circle.fill"
            messageColor = .green
            gameIsOver = true

            if bestScore == 0 || guessCount < bestScore {
                bestScore = guessCount
            }

        } else if guess < secretNumber {

            message = "Too Low! Try a higher number."
            messageSymbol = "arrow.up.circle.fill"
            messageColor = .blue

        } else {

            message = "Too High! Try a lower number."
            messageSymbol = "arrow.down.circle.fill"
            messageColor = .red
        }
    }

    func getNumberType(number: Int) -> String {
        if number % 2 == 0 {
            return "Even"
        } else {
            return "Odd"
        }
    }

    func decreaseGuessByTen() {
        if guess - 10 >= lowestNumber {
            guess -= 10
        } else {
            guess = lowestNumber
        }
    }

    func decreaseGuessByOne() {
        if guess > lowestNumber {
            guess -= 1
        }
    }

    func increaseGuessByOne() {
        if guess < highestNumber {
            guess += 1
        }
    }

    func increaseGuessByTen() {
        if guess + 10 <= highestNumber {
            guess += 10
        } else {
            guess = highestNumber
        }
    }

    func startNewGame() {
        secretNumber = Int.random(in: lowestNumber...highestNumber)
        guess = 50
        guessCount = 0
        lastGuess = 0
        message = "Make your first guess!"
        messageSymbol = "questionmark.circle.fill"
        messageColor = .blue
        gameIsOver = false
    }
}

#Preview {
    GuessingGameView()
}
