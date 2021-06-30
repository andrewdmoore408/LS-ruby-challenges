=begin

Triangles

Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

Problem
  Input(s): 3 integers (representing the length of the three sides of the triangle)
  Output(s): String (either "isosceles", "scalene", or "equilateral"). Raise an error if any of the inputs are < 1, and if the sum of any two of them isn't larger than the third

  Explicit Rules:
    All three inputs must be greater than 0
    The sum of any two must be greater than the remaining input
    If valid:
      3 sides the same? equilateral
      2 sides the same? isosceles
      else scalene
  Implicit Rules:

  Questions?
    Best way to go through and sum each other two? Duplicate args into an array, iterate through the indices, remove the current index and sum the other two?

	Notes/Thoughts

Examples/Test Cases

(Will use minitests provided)

Data Structures

Array

Algorithms

Validate triangle
  Make sure all sides are positive—raise error if not
  Check that the sum of each possible pair of sides is greater than the third side

Determine type
  All three sides equal? equilateral
  2 sides equal? isosceles
  none equal? scalene

  use Array#uniq to determine number of unique sides. 1 is equilateral, 2 is isosceles, 3 is scalene
=end

class Triangle
  attr_reader :kind

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    @kind = nil
    validate_triangle
    determine_kind
  end

  private

  def determine_kind
    self.kind = case count_unique_sides
                when 3 then "scalene"
                when 2 then "isosceles"
                else        "equilateral"
                end
  end

  attr_reader :sides
  attr_writer :kind

  def validate_triangle
    sides.each do |side|
      raise ArgumentError.new("All sides must be positive") unless side.positive?
    end

    sides.each_index do |index|
      sides_copy = sides.dup

      third_side = sides_copy.delete_at(index)

      raise ArgumentError.new("Invalid sides—-not a triangle") unless sides_copy.sum > third_side
    end
  end

  def count_unique_sides
    sides.uniq.size
  end
end