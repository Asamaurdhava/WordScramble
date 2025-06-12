    //
    //  ContentView.swift
    //  WordScramble
    //
    //  Created by Vishesh S Rajput on 06/06/25.
    //

    import SwiftUI

    struct ContentView: View {
        
        @State private var usedWords = [String]()
        @State private var rootWord = ""
        @State private var newWord = ""
        
        @State private var errorTitle = ""
        @State private var errorMessage = ""
        @State private var showingError = false
        
        @State private var score = 0
        
        @FocusState private var keyboardFocus: Bool
        
        var body: some View {
            
            NavigationStack {
                
                List {
                        
                    Section {
                        Text("The Root Word is : \(rootWord)")
                    }
                    .font(.title3)
                        
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .textInputAutocapitalization(.never)
                            .focused($keyboardFocus)
                    }
                    
                    Section {
                        Text("Your score is : \(score)")
                    }
                    .font(.headline)
                    
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                    
                }
                .navigationTitle("Word Scramble")
                .navigationBarTitleDisplayMode(.inline)
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError) { } message: {
                    Text(errorMessage)
                }
                .toolbar {
                    if keyboardFocus {
                        Button("Restart Game") {
                            startGame()
                            keyboardFocus = false
                        }
                    }
                }
                
            }
        }
        
        func addNewWord() {
            let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            
            if answer.count < 3 {
                wordError(title: "Short Word", message: "Your word is too short, guess big!")
                newWord = ""
                return
            } else if answer == rootWord {
                wordError(title: "Identical to Root Word", message: "You have to make new words, don't enter the original.")
                newWord = ""
                return
            }

            guard isOriginal(word: answer) else {
                wordError(title: "Word used already", message: "Be more original!")
                return
            }
            
            guard isPossible(word: answer) else {
                wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
                return
            }
            
            guard isReal(word: answer) else {
                wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
                return
            }
            
            withAnimation {
                usedWords.insert(answer, at: 0)
            }
            
            score += answer.count + 1
            
            newWord = ""
        }
        
        func startGame() {
            //Reset game state
            score = 0
            usedWords.removeAll()
            
            if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
                if let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8) {
                    let allWords = startWords.components(separatedBy: "\n")
                    rootWord = allWords.randomElement() ?? "silkworm"
                    return
                    
                }
            }
            
            fatalError("Could not load start.txt from bundle.")
        }
        
        func isOriginal(word: String) -> Bool {
            !usedWords.contains(word)
        }
        
        func isPossible(word: String) -> Bool {
            var tempWord = rootWord
            
            for letter in word {
                if let pos = tempWord.firstIndex(of: letter) {
                    tempWord.remove(at: pos)
                } else {
                    return false
                }
            }
            
            return true
        }
        
        func isReal(word: String) -> Bool {
            let checker = UITextChecker()
            let range = NSRange(location: 0, length: word.utf16.count)
            let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
            
            return misspelledRange.location == NSNotFound
        }
        
        func wordError(title: String, message: String) {
            errorTitle = title
            errorMessage = message
            showingError = true
        }

    }

    #Preview {
        ContentView()
    }
