=begin

Anagrams

Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

Problem
  Input(s): string; array of strings (possible anagrams)
  Output(s):  array of strings which are anagrams

  Explicit Rules:
    Return an array containing the elements from the input array which are anagrams of the input string
  Implicit Rules:
    Need a Anagram#match method which will return the matching anagrams
    To be counted as an anagram, the word from the array must not be the same as the initial word
    Anagrams are case-insensitive
    Neither input will ever be empty

  Questions?

	Notes/Thoughts

Examples/Test Cases

Data Structures

Strings
Arrays of chars

Algorithms

Initialize an empty array, anagrams, to hold result

Iterate through each potential anagram
  Invoke #tally to count the occurrence of each letter in the potential anagram
  If the tallies match, and the potential anagram isn't the same as the object's word, add the potential anagram to the anagrams array
Return the anagrams array
=end

class Anagram

  def initialize(word)
    @word = word
  end

  def match(potential_anagrams)
    potential_anagrams.select do |potential_anagram|
      same_letter_count(potential_anagram) && different_word(potential_anagram)
    end
  end

  private

  attr_reader :word

  def different_word(other_word)
    other_word.downcase != word.downcase
  end

  def same_letter_count(other_word)
    other_word.downcase.chars.tally == word.downcase.chars.tally
  end
end