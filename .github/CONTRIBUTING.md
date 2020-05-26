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


### About branches
 - **master**: This branch is considered "stable" and is permanent. Each push to this branch comes with a new release.
 - **dev**: This is the default branch, it is considered "unstable" and is permanent. You should open PR to this branch.
 - feat_***: This is a feature branch which you should open to temporarly work on a new feature.
 - iss###: This is an issue branch which you should open to temporarly work on fixing an issue.

Please, try to keep your branch name snake_case. Also, try to be gentle with your commit history.

## Code Formatting Guidelines
Please, try to follow those guidelines as much as possible so your code "belongs".

### General
 - Variables should be camelCase.
 - Class name should be PascalCase.
 - Functions/methods' parameters should be led by `p_` [eg `p_myParameter`].
 - Provide informative comments to explain obscure code.
 
### Java
 - Functions/methods should be PascalCase.
 - Use the `this` keyword whenever possible.
 - Member variables should be `private` or `protected` most of the time.

#### About packages
 - **editor**: This package should contain only the UI-related (JFrame) classes.
 - **model**: This package should contain all the classes that are used to represent a component such as a file or a directory.
 - **service**: This package should contain all the classes that provide a service (eg. serializartion, logging, etc.).
 
### Lua
 - Functions/methods should be camelCase for consistency with Löve2D.
 - Whenever applicable, variable should state type [eg `strName` or `p_numDamage`].
