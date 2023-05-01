# QUIWA Easy pseudocode language flex lexical analyzer

This repository contains a lexical analyzer for the Easy Pseudocode Language introduced in Prof. Quiwa's Data Structures book. It is a requirement for CS 155 Compiler Course.

## How to Use

1. Clone this repository to your desired destination using the command: `git clone https://github.com/Syyan7979/cs155Pset1-EASY-Language-Lexer.git`
2. Navigate to the directory where the contents of this repository are stored.
3. The lexical generator is already compiled as `a.out`. Run it using the following command: 
   - `./a.out <directory of the file containing the Easy Pseudocode>`
4. If you wish to recompile the code again, follow these steps: 
   - Install `flex` and `gcc` on your system if not already installed.
   - For Mac users, run the following commands:
     - `flex easy.lex`
     - `gcc lex.yy.c -ll`
   - For Linux users, run the following commands:
     - `flex easy.lex`
     - `gcc lex.yy.c`
5. Run the compiled lexical analyzer using step 3 above.

Note: Replace `<directory of the file containing the Easy Pseudocode>` with the actual directory where the Easy Pseudocode file is located.
