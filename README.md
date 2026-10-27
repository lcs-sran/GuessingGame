#About the Game

This is a number guessing game made with SwiftUI in Swift.

The computer chooses a secret number between 1 and 100. The player tries to guess the number by using the buttons on the screen.

The player can:

Increase the guess by 1 or 10.

Decrease the guess by 1 or 10.

Press the Guess button to check their guess.

See how many guesses they have made.

Play again after finding the correct number.

#What I Added

High and low hints: When the player guesses incorrectly, the game tells them if their guess is too high or too low.

Different messages: If the guess is too low, the game tells the player to try a higher number. If the guess is too high, it tells the player to try a lower number.

Different colours and symbols: A wrong guess shows an arrow and a colour to help the player understand the hint. A correct guess shows a green success symbol.

Improved feedback: The player gets more useful information after each guess, making the game easier to understand and play.

I changed the checkGuess() function to compare the player's guess with the secret number. I kept the existing game structure and the other functions.

#How to Play

Look at the number displayed on the screen.

Use the -10, -1, +1, and +10 buttons to change your guess.

Press Guess to check your number.

If the number is too low, try a higher number.

If the number is too high, try a lower number.

Keep guessing until you find the secret number.

Press Play Again to start a new game.

The game also keeps track of the number of guesses made.

#Testing

I tested the game to make sure the new high and low hints work correctly.

Test 1: Guess Too Low

Input: The secret number is 7, and I guess 3.

Expected Result: The game tells me that my guess is too low and suggests trying a higher number. An upward arrow appears, and the message is orange.
Result: Passed.

Test 2: Guess Too High

Input: The secret number is 7, and I guess 9.

Expected Result: The game tells me that my guess is too high and suggests trying a lower number. A downward arrow appears, and the message is red.

Result: Passed.

Test 3: Guess Correctly

Input: The secret number is 7, and I guess 7.

Expected Result: The game displays a correct message with a green success symbol. The game ends, and the Play Again button appears.

Result: Passed.

Test 4: Guess Counter

Input: I make an incorrect guess.

Expected Result: The guess counter increases by one after each guess.

Result: Passed.

Test 5: Play Again

Input: I guess the correct number and press Play Again.

Expected Result: The game chooses a new random number, resets the guess counter to zero, and allows me to play again.

Result: Passed.
#Credits

The starting game was written by Mr. Gordon.

High and low hints: Gemini suggested changes to the checkGuess() function. I reviewed the suggested code, added it to my project, and tested the game.

