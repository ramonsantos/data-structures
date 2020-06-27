# frozen_string_literal: true

module DataStructures
  class List
    def initialize
      @size    = 0
      @header  = nil
      @trailer = nil
    end

    # Adds element to the end of the list
    def append(element)
      @size += 1
      new_node = Node.new(element)

      if @header
        @trailer.next = new_node
        new_node.prev = @trailer
      else
        @header = new_node
      end

      @trailer = new_node
    end

    # Adds element at the beginning of the list
    def prepend(element)
      # TODO
    end

    # Adds element in determined index
    def insert_at(element, index)
      # TODO
    end

    # Removes element
    def remove(element)
      # TODO
    end

    # Removes element by index
    def remove_at(index)
      # TODO
      @size -= 1
    end

    # Removes all elements
    def clean
      # TODO
    end

    # Returns the first element
    def first
      # TODO
    end

    # Returns the last element
    def last
      # TODO
    end

    # Returns the index of element
    def index_at(element)
      # TODO
    end

    # Returns element by index
    def get(index)
      # TODO
    end

    # Sets the element at index
    def set(element, index)
      # TODO
    end

    # Swap the position of two elements
    def swap(index_a, index_b)
      # TODO
    end

    # Inverts the list order
    def revert
      # TODO
    end

    # Returns the size of list
    def size
      @size
    end

    # Returns true if the given element is present in list, otherwise returns false
    def include?(element)
      # TODO
    end

    # Returns true if list contains no elements, otherwise returns false
    def empty?
      @size.zero?
    end

    def inspect
      "[#{build_elements_to_inspect}]"
    end

    private

    def build_elements_to_inspect
      return nil if empty?
      return @header.data if @header == @trailer
      return short_inspect if @size > 5

      full_inspect
    end

    def full_inspect
      result = @header.data.to_s

      pointer = @header.next

      until pointer.nil?
        result += ", #{pointer.data}"

        pointer = pointer.next
      end

      result
    end

    def short_inspect
      "#{@header.data}, #{@header.next.data}, ..., #{@trailer.prev.data}, #{@trailer.data}"
    end
  end
end
