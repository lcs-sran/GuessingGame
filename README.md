#Guessing Game

#About the Game

This is a number guessing game made with SwiftUI in Swift.

The computer chooses a secret number between 1 and 100. The player tries to find the secret number by changing their guess and pressing the Guess button.

The game gives hints when a guess is too high or too low. It also counts the number of guesses and keeps track of the player's best score.

How to Play

Look at the number displayed on the screen.

Use the -10, -1, +1, and +10 buttons to change your guess.

Press Guess to check your number.

If your guess is too low, try a higher number.

If your guess is too high, try a lower number.

Do not guess the same number twice. Change your number before pressing Guess again.

Keep guessing until you find the secret number.

Press Play Again to start a new game.

#What I Added

1. High and Low Hints

When the player guesses incorrectly, the game tells them if their guess is too high or too low.

2. Different Messages, Colours, and Symbols

A low guess shows an orange message with an upward arrow. A high guess shows a red message with a downward arrow. A correct guess shows a green success message and a checkmark.

3. Best Score

The game records the fewest guesses the player has needed to win. If the player wins another game with fewer guesses, the best score is updated. The best score stays when the player starts a new game.

4. Even or Odd

The game tells the player whether the secret number is even or odd. This uses the remainder operator (%) to check whether the number can be divided by 2 with no remainder.

5. Prevent Repeated Guesses

The game remembers the player's last guess. If the player presses Guess without changing the number, the game displays a warning. The guess counter does not increase. The player must choose a different number before guessing again.

#How it Works

The game uses lowestNumber and highestNumber as constants because the number range does not change. The secretNumber variable uses Int.random() to choose a random number between these two limits.

The guess, guessCount, bestScore, and lastGuess variables store information that can change during the game.

The checkGuess() function uses if, else if, and else to compare the player's guess with the secret number. It also checks whether the player has repeated their last guess. If the guess is repeated, the function shows a warning and uses return to stop checking.

The Best Score feature uses || to check whether there is no previous record or whether the player has made a new record with fewer guesses. I used || because either condition should update the best score.

The getNumberType(number:) function has an integer parameter and returns a String. It uses the remainder operator % to decide whether the secret number is even or odd. If the remainder after dividing by 2 is 0, the number is even. Otherwise, it is odd.

The startNewGame() function chooses a new random number and resets the guess, guess counter, last guess, and game messages. It does not reset the best score because the player should be able to keep their record while playing.

#Testing

I tested the game to make sure all the features work correctly.

Test 1: One Below the Secret Number (Edge)

Input: The secret number is 7, and I guess 6.

Expected Result: The game tells me that my guess is too low and suggests trying a higher number. An upward arrow appears, and the message is orange. The guess counter increases by one.

Result: The game showed the too low message with an orange upward arrow. The guess counter increased by one.

Test 2: One Above the Secret Number (Edge)

Input: The secret number is 7, and I guess 8.

Expected Result: The game tells me that my guess is too high and suggests trying a lower number. A downward arrow appears, and the message is red. The guess counter increases by one.

Result: The game showed the too high message with a red downward arrow. The guess counter increased by one.

Test 3: Lowest Guess (Edge)

Input: The secret number is 7, and I guess 1.

Expected Result: The game tells me that my guess is too low and suggests trying a higher number. The guess stays within the allowed range.

Result: The game showed the too low message, and the guess stayed at 1.

Test 4: Guess Correctly

Input: The secret number is 7, and I guess 7.

Expected Result: The game displays a correct message with a green checkmark. The game ends, and the Play Again button appears.

Result: The game showed the correct message with a green checkmark. The game ended, and Play Again appeared.

Test 5: Prevent Repeated Guesses

Input: The secret number is 7. I guess 6, and then I press Guess again without changing the number.

Expected Result: The game displays a warning message telling me that I already guessed this number. The guess counter does not increase.

Result: The game displayed the warning message, and the guess counter did not increase.

Test 6: Change a Repeated Guess

Input: The secret number is 7. I guess 6, then change my guess to 7.

Expected Result: The game accepts the new guess and displays the correct message.

Result: The game accepted the new guess and showed the correct message.

Test 7: Best Score

Input: I win one game in 4 guesses, then win another game in 3 guesses.

Expected Result: The best score changes from 4 to 3 because I won the second game with fewer guesses.

Result: The best score updated to 3 guesses.

Test 8: Even or Odd

Input: I test the game with an even secret number and an odd secret number.

Expected Result: The game displays "Even" for an even number and "Odd" for an odd number.

Result: The game displayed the correct number type for both tests.

Test 9: Play Again

Input: I guess the correct number and press Play Again.

Expected Result: The game chooses a new random number, resets the guess counter to zero, and keeps the best score.

Result: The game started a new game, reset the guess counter to zero, and kept the best score.

Testing the Random Number

To make the tests give the same results every time, I temporarily changed the secret number to 7 in my code. After testing, I changed it back to use a random number between 1 and 100.

#Credits

The starting game was written by Mr. Gordon.

Gemini suggested changes and helped me understand how to add the Best Score, Even or Odd, and repeated guess features. I reviewed the suggested code, added it to my project, and tested the game.

I wrote and updated the README myself.
