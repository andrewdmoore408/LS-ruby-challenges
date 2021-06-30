=begin

Scrabble Score

Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

You'll need the following tile scores:
Letter 	Value
A, E, I, O, U, L, N, R, S, T 	1
D, G 	2
B, C, M, P 	3
F, H, V, W, Y 	4
K 	5
J, X 	8
Q, Z 	10

How to Score

Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

    3 points for C
    1 point for each A (there are two)
    3 points for B (there are two)
    2 points for G
    1 point for E

Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

P
Input: a string
Output: integer (value of each letter added up according to Scrabble values)

Notes

Need both #score and ::score to return the value. Can I write a method once and have it be available for both? Write class method and have instance method call that class method using class.self.score?

Questions?

Best way to represent scores? Use a hash for lookup with arrays as keys and the value of the letters as value? Then could iterate through that hash


E

(test suite)

D

String
Array of chars

A

Use a constant hash to hold arrays of letters and the value associated with each array's set of letters
Initialize score to 0
Iterate through each char in the string
  Calculate the value for each char
    Add it to score
Return score

=end

class Scrabble
  LETTER_VALUES = {['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
                  ['D', 'G'] =>	2,
                  ['B', 'C', 'M', 'P'] =>	3,
                  ['F', 'H', 'V', 'W', 'Y'] => 4,
                  ['K'] => 5,
                  ['J', 'X'] =>	8,
                  ['Q', 'Z'] =>	10}

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def self.score(word = self.word)
    return 0 if word.nil?

    score = 0

    word.each_char do |char|
      score += letter_value(char)
    end

    score
  end

  def score
    self.class.score(self.word)
  end

  def self.letter_value(char)
    LETTER_VALUES.each do |letters, score|
      return score if letters.include?(char.upcase)
    end

    0
  end
end