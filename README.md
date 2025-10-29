# Ruby Language Overview

A comprehensive reference document covering Ruby's design philosophy, paradigms, and key language features.

## Language Origins

### Name Inspiration
The creator wanted to name the language after a gemstone, as a reference to the language being a successor to Perl. Ruby is the sequential birthstone as well as being a short named gemstone.

### Purpose and Design Goals
Ruby was designed to be a true object-oriented language that encourages productivity with multi-purpose use and natural syntax that makes it simple to read and write.

## Programs
- **Trivial program:** “Hello World”
Programmers: Ian, Charles
Program that prints the string “Hello world” to the console. However, done with a very basic lambda function (unique Ruby feature) to output Hello World, that is then executed with a ‘call’ function.

- **Intermediate Program 1:** Polynomial addition calculator
Programmers: Joseph, Josiah
Program that takes user string input of two polynomial functions. The string will then be split into multiple tokens, which will then be stored as their own objects with coefficients and exponents in a “term” class. A Polynomial class will store an array of these polynomial term objects arranged in order of exponent, allowing us to iterate through and compare polynomials, to output a polynomial sum back to the user. All in all, this program displays classes/objects in Ruby, user interaction, and string parsing.

- **Intermediate Program 2:** Banking Interface
Programmers: Charles, Joseph
Program that has a database (simple array or hash) of account objects with attributes such as account holder name and account balance. Prompts user with options to create, view, and modify. For instance, they can search for a specific account’s information, add additional accounts, and perform actions such as withdrawals (with validation), or print a bank account report to a file. Displays nature of classes/objects, user interaction, and file writing in Ruby.

- **Intermediate Program 3:** Shape Area calculator
Programmers: Ian, Josiah
A program that prompts the user to select a shape and input required data, then returns the area of the shape. Use of parent ‘Shape’ class with a function for calculating area that subclasses (specific shape classes) will inherit from and overwrite. Use of unique Ruby concepts such as mixins to format and print results (dimensions, area), to keep the Shape classes solely for making calculations with the data. Displays inheritance and object-orientation in Ruby.

- **Complex Program w/ Data Structure:** Symbol matching
Programmers: Everyone
Program that reads a text file, and checks for matching opening and closing symbols (for ex. parentheses, brackets, comments). This will be done through a custom stack class with an array where we write the code for the push, pop, peek, and empty methods. The program will then provide specific feedback for errors (which symbols are missing/mismatched and which lines), if any. This displays Ruby’s file reading, and more of its object orientation with our custom data structure

### Primary Paradigm
**Object-Oriented**

Ruby is purely object-oriented, dynamically typed, and simple to read.

### Supported Paradigms

- **Functional**: Ruby has immutable state
- **Procedural**: Despite being purely object-oriented, variables and functions can be defined outside of the class
- **Dynamic**: The language has dynamic typing as well as other dynamic features

## Language Implementation

### Execution Model
Ruby is primarily an interpreted language, but also has steps of compilation when it comes to execution.

### Grammar
[BNF Syntax of Ruby](https://www.cse.buffalo.edu/~regan/cse305/RubyBNF.pdf)

### Notable Features
Ruby works purely with object-oriented programming. Variables are dynamically typed and very flexible.

### Type System Characteristics
- **Typing**: Dynamic
- **Type Checking**: Strong

Ruby is strongly typed as there is type checking done before operations are performed, and it requires explicit type conversion to prevent unpredictable behavior from incompatible types.

### Primitive Types
Ruby doesn't have any primitive types because everything is an object.

### Constructed Types
Ruby supports:
- Arrays
- Hashes
- Ranges
- Strings

## Polymorphism

Ruby does not support overloading, parameter coercion, or parametric coercion because it is dynamically typed and doesn't confirm types at compile time but rather checks if objects behave as expected, and methods of the same name are defined by whichever is most recent.

**Supported**: Subtype polymorphism

## Scoping and Namespaces

### Namespaces
Ruby supports namespaces. They are defined by using the keyword `module` in front of the namespace name, and submembers of the namespace are accessed with the `::` operator.

### Nested Functions
Ruby does not support nested named functions because as methods are defined within other methods, they are not local.

### Scoping Behavior
Ruby's blocks can modify variables from the outer scope.

## Memory Management

Ruby handles dynamically allocated memory through garbage collection using a mark and sweep algorithm.

## Object-Oriented Features

### Core OO Support
Ruby claims to support object-orientation. In Ruby, objects are instances of classes which establish their attributes and methods. Abstraction, polymorphism, inheritance, and encapsulation are all supported in this language.

### Encapsulation and Information Hiding
Ruby supports encapsulation, and to a slight degree it supports information hiding.

### Classes
Ruby uses classes with attributes and methods to design objects.

### Inheritance
Inheritance is supported although each class can only inherit from one single superclass. Multiple inheritance is still supported through mix-ins. Conflicts are handled by Ruby's built-in MRO (Method Resolution Order).

## Parameter Passing

Ruby leans closer to pass by reference, mutating the original objects passed in its methods. However, in the case of assignment, only the pointer is changed meaning it becomes bound to a different object rather than changing the object itself, which is reflective of pass-by-value.

---

*This document serves as a quick reference for Ruby's language characteristics and design decisions.*
