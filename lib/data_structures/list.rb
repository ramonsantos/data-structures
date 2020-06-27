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
      # TODO
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
      # TODO
    end

    # Returns true if the given element is present in list, otherwise returns false
    def include?(element)
      # TODO
    end

    # Returns true if list contains no elements, otherwise returns false
    def empty?
      # TODO
    end
  end
end
