# WordScramble

A SwiftUI-based word game that challenges users to create as many valid words as possible from a given root word, with real-time scoring and intelligent input validation.

---

## Overview

**WordScramble** is a fun and educational iOS application designed to enhance vocabulary and spelling skills. The app presents users with a random root word and tasks them with generating new words using its letters. The game validates each entry for originality, possibility, and correctness, providing instant feedback and maintaining a running score.

---

## Core Functionality

- **Dynamic Root Word:** Randomly selected from a bundled word list at each game start.
- **Real-Time Scoring:** Earn points for every valid word, with longer words scoring higher.
- **Intelligent Validation:** Checks each entry for originality, letter usage, and dictionary correctness.
- **User Feedback:** Instant alerts for invalid or repeated words.
- **Game Restart:** Easily reset the game and start with a new root word.

---

## Features

### Gameplay

- **Word Creation:** Enter words using the root word’s letters.
- **Validation Checks:**
  - **Originality:** No repeats.
  - **Possibility:** Only use letters from the root word.
  - **Correctness:** Must be a real English word.
- **Scoring System:** Points based on word length, rewarding longer valid words.

### User Interface

- **SwiftUI Design:** Clean, intuitive interface with organized sections.
- **Live Feedback:** Real-time score updates and error alerts.
- **Accessibility:** Optimized for keyboard use and touch controls.

### Input Parameters

- **Root Word:** Randomly chosen from a text file on app launch or reset.
- **User Entry:** TextField for word input, with real-time validation.

---

## Requirements

- **iOS:** 15.0+
- **Xcode:** 13.0+
- **Swift:** 5.5+
- **No external dependencies**

---

## Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/WordScramble.git
   ```
2. **Open** `WordScramble.xcodeproj` **in Xcode**
3. **Ensure** `start.txt` **is included in the project bundle**
4. **Build and run** on your preferred device or simulator

---

## Usage

1. **Start the Game:** The app displays a random root word.
2. **Enter Words:** Type your word and submit.
3. **Score Points:** Valid words are added to your list and increase your score.
4. **Restart:** Use the toolbar button to reset the game with a new root word.

---

## Code Architecture

- **State Management:** Uses `@State` properties for dynamic UI updates.
- **Validation Logic:** Separate functions for originality, possibility, and dictionary checks.
- **Error Handling:** SwiftUI alerts for invalid entries.
- **UI Structure:** Organized with `List` and `Section` for clarity.

---

## Technical Concepts Demonstrated

- **SwiftUI Forms:** Modern, reactive UI with logical grouping.
- **Text Validation:** Real-time checks using `UITextChecker`.
- **State-Driven UI:** Immediate feedback and updates.
- **Randomization:** Selecting root words from a bundled file.

---

## Educational Value

This project demonstrates:

- SwiftUI data binding and reactive UI design
- State management and input validation
- File handling and randomization
- User feedback and error handling in iOS apps

---

## Acknowledgements

Inspired by Paul Hudson’s [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. All credit for the original concept, structure, and educational content goes to Paul Hudson and the Hacking with Swift community. This repository is intended solely for personal learning and demonstration.

---

## Author

**Vishesh Singh Rajput aka specstan**

---

## License

This project is created for educational purposes as part of learning iOS development with SwiftUI. The implementation follows Paul Hudson's tutorial structure and is intended for personal skill development and portfolio demonstration.

For commercial use or distribution, please refer to the original course terms and conditions.
