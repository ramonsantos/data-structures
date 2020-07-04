# frozen_string_literal: true

module DataStructures
  class Stack
    def initialize
      @size    = 0
      @header  = nil
      @trailer = nil
    end

    # Adds element
    def push(element)
      new_node = Node.new(element)

      if @header
        new_node.prev = @trailer
        @trailer.next = new_node
      else
        @header = new_node
      end

      @trailer = new_node

      @size += 1
    end

    # Removes element
    def pop
      raise(StandardError, 'IndexError') if empty?

      if size == 1
        node = @header
        @header = nil
        @trailer = nil
      else
        new_trailer = @trailer.prev
        new_trailer.next = nil
        @trailer.prev = nil
        node = @trailer
        @trailer = new_trailer
      end

      @size -= 1
      node.data
    end

    # Returns the size of stack
    def size
      @size
    end

    # Returns true if stack contains no elements, otherwise returns false
    def empty?
      @size.zero?
    end

    # Returns the top element
    def top
      @trailer&.data
    end

    def inspect
      "[#{build_elements_to_inspect}"
    end

    private

    def build_elements_to_inspect
      return nil if empty?
      return " #{@header.data}" if @header == @trailer

      full_inspect
    end

    def full_inspect
      result = " #{@header.data}"

      pointer = @header.next

      until pointer.nil?
        result += " | #{pointer.data}"

        pointer = pointer.next
      end

      result
    end
  end
end
