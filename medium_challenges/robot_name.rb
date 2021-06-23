=begin

Robot Name

Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. Your solution should not allow the use of the same name twice when avoidable.

Problem
  Input(s): Instantiation or call to Robot#reset
  Output(s): A random alphanumeric string with 2 uppercase letters and 3 decimal digits (the robot's name)

  Explicit Rules:
    Names should be random
    Same name should not be used when reset
  Implicit Rules:
    The name should be assigned to an instance variable @name which has a public getter
    The Robot#reset method will generate a new name and reassign the instance variable

  Questions?

	Notes/Thoughts
    Use a helper method to generate the random name. When #reset is invoked, call that method and compare the new name with the current name to check that it's different before reassigning @name

Examples/Test Cases

Data Structures

Arrays (for sampling: one of uppercase letters, one of digits)

Algorithms
  Create the random name upon instantiation
    Helper method: create random name
      Use an array of uppercase letters and one of digits
      Sample the letters twice and numbers thrice and concatenate them in order into a string
      Assign this string to @name, which has a public getter

  #reset
    Create another name
    Reassign the new name to @name if it hasn't been used
    Otherwise, make another one
=end

class Robot
  LETTERS = ("A".."Z").to_a * 2
  NUMBERS = (0..9).to_a * 3
  @@history = []

  attr_reader :name

  def initialize
    @name = nil
    reset
  end

  def reset
    new_name = nil

    loop do
      new_name = generate_name
      break unless new_name == name || @@history.include?(new_name)
    end

    @@history.delete(name)
    @@history << new_name
    self.name = new_name
  end

  private

  attr_writer :name

  def generate_name
    letters = LETTERS.sample(2).shuffle
    numbers = NUMBERS.sample(3).shuffle
    (letters + numbers).join
  end
end
