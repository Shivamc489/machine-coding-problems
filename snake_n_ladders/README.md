# Snake and Ladders Game

This pull request implements a Snake and Ladders game as part of our machine coding practice series.
Question can be found at -> [workat.tech](https://workat.tech/machine-coding/practice/snake-and-ladder-problem-zgtac9lxwntg)

## Problem Statement

Implement a Snake and Ladder game that:
- Supports a configurable board size
- Allows multiple players
- Handles snakes and ladders
- Supports multiple dice
- Includes configurable game rules

## Implementation Details

### Core Classes

1. `Game`: Manages the overall game flow
2. `Board`: Represents the game board and handles movement
3. `Snake` and `Ladder`: Represent snakes and ladders on the board
4. `User`: Represents a player
5. `Dice`: Simulates dice rolls
6. `GameConfiguration`: Handles configurable game rules

### Key Features

- Configurable board size
- Multiple players support
- Multiple dice support
- Customizable game rules:
  - End game condition (first to finish or till last player)
  - Extra dice roll on getting the maximum value
  - Invalid dice roll handling (e.g., three consecutive sixes)

### How to Run

1. Ensure you have Ruby installed on your system
2. Navigate to the project directory
3. Run the game using:
   ```
   ruby main.rb
   ```
4. Follow the prompts to set up the game and play

### Sample Input

```
10 10
1 6
9
62 5
33 6
49 9
88 16
41 20
56 53
98 64
93 73
95 75
8
2 37
27 46
10 32
51 68
61 79
65 84
71 91
81 100
4
Shivam
Chaitanya
Gaurav
Sagar
```

This input sets up a 10x10 board with 1 die (6-sided), 9 snakes, 8 ladders, and 4 players.

## Testing

To test the implementation:
1. Run the game with various inputs
2. Verify that players move correctly, including snake and ladder interactions
3. Check that the game ends according to the configured rules
4. Ensure that dice rolls and extra rolls are handled correctly

## Future Improvements

1. Add unit tests for each class
2. Implement a graphical user interface
3. Add support for saving and loading game states
4. Introduce more advanced game variations and rules

Please review the implementation and provide any feedback or suggestions for improvement.
