=begin
Simple Linked List

Write a simple linked list implementation. The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.

The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide functions to reverse the linked list and convert a linked list to and from an array.

Problem

  Implement a single linked list with the capability to reverse it and convert it to and from an array

  Explicit Rules:
    Create a class that implements a single linked list
      Elements may contain a range of data
      Method to reverse the list
      Convert to and from an array
  Implicit Rules:
    Element (collaborator objs)
      Default link to next should be nil
      #datum method to get data, #next method to retrieve link to next element
      Initialize takes 2 args: datum, next=nil
      #tail return whether or not this element is the tail of a list. What should default be?
    SimpleLinkedList class
      #size method returns size of list (number of elements)
      #empty method: boolean whether list is empty or not
      #push method: create an element for passed in datum and add it to the end of list
      #to_a: convert list into an array and return it (empty array if list.empty?)
      #from_a: convert the passed in array to a linked list of elements
      #head: return the first element in the list

  Questions?

	Notes/Thoughts
    Use a collaborator object for elements (list items)
      Needs to contain the data itself and the link to the next element
      Method to set/retrieve data, and set/retrieve link to the next element (list class will set the links using public setter method )

Examples/Test Cases

Data Structures

Algorithms

#reverse method
  Initialize an empty array (arr)
  Go through each element in the list beginning at the head
  Add each element to arr
  After reaching the tail and adding that, reverse arr
  Go through arr and link the elements together (index 0 is the head) by setting their next instance variables
=end

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head

  def initialize
    @size = 0
    @head = nil
  end

  def empty?
    size.zero?
  end

  def self.from_a(arr)
    list = SimpleLinkedList.new
    return list if arr.nil?

    arr.reverse.each { |elem| list.push(elem) }
    list
  end

  def peek
    return nil if head.nil?

    head.datum
  end

  def pop
    new_head = head.next
    popped = head.datum
    self.head = new_head
    self.size -= 1
    popped
  end

  def push(item)
    elem = Element.new(item)
    elem.next = head
    self.head = elem
    self.size += 1
  end

  def reverse
    elements = to_a
    elements.reverse!
    reversed = SimpleLinkedList.from_a(elements)
    reversed
  end

  def to_a
    arr = []

    return arr if empty?

    current = head

    loop do
      arr.push(current.datum)

      break if current.tail?
      current = current.next
    end

    arr
  end

  private

  attr_writer :head, :size
end