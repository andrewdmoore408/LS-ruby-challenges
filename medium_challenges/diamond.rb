=begin

Diamond

The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

    The first row contains one 'A'.
    The last row contains one 'A'.
    All rows, except the first and last, have exactly two identical letters.
    The diamond is horizontally symmetric.
    The diamond is vertically symmetric.
    The diamond has a square shape (width equals height).
    The letters form a diamond shape.
    The top half has the letters in ascending order.
    The bottom half has the letters in descending order.
    The four corners (containing the spaces) are triangles.

    Examples

Diamond for letter 'A':

A

Diamond for letter 'C':

  A
 B B
C   C
 B B
  A

Diamond for letter 'E':

    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A


Problem
  Input(s): Letter of the alphabet (uppercase)
  Output(s): Diamond constructed of uppercase letters and spaces (returned as a string containing newlines)

  Explicit Rules:
    Diamond begins and ends with A by itself
    All other lines have the same letter appearing twice
    Letters are spaced to make a diamond--expanding outward on the top half and shrinking back on the bottom half
    Letters go up from A-input until the middle, then reverse back to A
    Same number of characters for width and height
  Implicit Rules:


  Questions?

  How to calculate height/width? Figure something out connected to the letter being passed in as input

	Notes/Thoughts

  Edge case: if A, just return 'A\n'; otherwise there will be multiple lines in the diamond shape

  C is the 3rd letter of the alphabet and its diamond has 5 lines; E is the 5th letter and has 9 lines; H is the 8th letter and its diamond has 15 lines. Number of letter (1-indexed!) times 2 minus 1 gives the height (and therefore also the length)

  First and last rows have A centered; all else have two letters.

  Iterate up to index of input and then subtract back down...?j

  All that a given line needs to know is its letter and overall width--everything else can be tracked by changing index and passing in that index's letter to a make_line method

  Spaces in the middle: B (index 2) has 1; C has 3; D has 5, etc. Beginning at index 2, multiply (index - 1) times 2 and subtract 1. Same as

Examples/Test Cases

See above and test file

Data Structures

Array of letters

Algorithms

Calculate the index of the letter that was passed in (and add 1--need to use 1-indexing for this)
Width and height is this (index * 2) - 1

=end
require 'pry'

class Diamond
  LETTERS_TO_INDEX = ('A'..'Z').to_a.unshift(nil)
  SPACES_FOR_LETTERS = 2

  def self.make_diamond(letter)
    return "A\n" if letter == "A"

    @@diamond_letters = get_diamond_letters(letter)
    @@diamond_width = get_width(letter)

    @@diamond_str = ""

    @@diamond_letters.each do |letter|
      @@diamond_str += construct_line(letter)
    end

    @@diamond_str
  end

  def self.construct_line(letter)
    return "A".center(@@diamond_width) + "\n" if letter == "A"

    # binding.pry
    internal_space_count = get_width(letter) - SPACES_FOR_LETTERS
    internal_spaces = " " * internal_space_count

    side_space_count = (@@diamond_width - internal_space_count - SPACES_FOR_LETTERS) / 2
    side_spaces = side_space_count.negative? ? "" : " " * side_space_count

    "#{side_spaces}#{letter}#{internal_spaces}#{letter}#{side_spaces}\n"
  end

  def self.get_width(letter)
    (letter_index(letter) * 2) - 1
  end

  def self.letter_index(letter)
    LETTERS_TO_INDEX.index(letter)
  end

  def self.get_diamond_letters(letter)
    top_half = ('A'..letter).to_a
    bottom_half = top_half.reverse
    bottom_half.shift
    top_half + bottom_half
  end
end