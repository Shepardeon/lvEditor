# Contributing Guide

First of all, thank you very much for checking out how to help! Feel free to contact me on Discord (**ShépardéonDev#5271**) if you have any question.

## Setup
To contribute to this project, I'll recommend you to use:
 - [Visual Code Studio](https://code.visualstudio.com/) to contribute to the Lua/Löve2D part.
 - [IntelliJ IDEA](https://www.jetbrains.com/fr-fr/idea/) to contribute to the editor.
 
## Workflow
 
### Contributing to Code Base
 1. Fork the project
 2. Make all the code changes you see fit
 3. Open a PR stating/explaining all the changes you made
 4. Feel free to ping me on Discord when you opened a PR :)
 
 
### Opening an issue
 - Whenever possible use a provided template
 - Give as much information and context as possible
  
## Code Formatting Guidelines
Please, try to follow those guidelines as much as possible so your code "belongs".

### General
 - Variables should be camelCase
 - Class name should be PascalCase
 - Functions/methods' parameters should be led by `p_` [eg `p_myParameter`]
 - Provide informative comments to explain obscure code
 
### Java
 - Functions/methods should be PascalCase
 - Use the `this` keyword whenever possible
 - Member variables should be `private` or `protected` most of the time
 
### Lua
 - Functions/methods should be camelCase for consistency with Löve2D
 - Whenever applicable, variable should state type [eg `strName` or `p_numDamage`]
