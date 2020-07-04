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
        new_node.prev = @trailer
        @trailer.next = new_node
      else
        @header = new_node
      end

      @trailer = new_node
    end

    # Adds element at the beginning of the list
    def prepend(element)
      @size += 1
      new_node = Node.new(element)

      if @header
        @header.prev = new_node
        new_node.next = @header
      else
        @trailer = new_node
      end

      @header = new_node
    end

    # Adds element in determined index
    def insert_at(element, index)
      raise(StandardError, 'IndexError') unless valid_index?(index)
      return append(element) if index == size || size.zero?
      return prepend(element) if index.zero?

      if index <= size / 2
        node_prev = @header
        (index - 1).times.each do
          node_prev = node_prev.next
        end
        node_next = node_prev.next
      else
        node_next = @trailer
        ((size - 1) - index).times.each do
          node_next = node_next.prev
        end
        node_prev = node_next.prev
      end

      new_node = Node.new(element)

      node_prev.next = new_node
      new_node.prev = node_prev

      node_next.prev = new_node
      new_node.next = node_next

      @size += 1
    end

    # Removes element by index
    def remove_at(index)
      raise(StandardError, 'IndexError') unless remove_valid_index?(index)

      index = (index % size)

      if size == 1
        node = @header
        @header = nil
        @trailer = nil
      elsif index.zero?
        new_header = @header.next
        new_header.prev = nil
        @header.next = nil
        node = @header
        @header = new_header
      elsif index == (size - 1)
        new_trailer = @trailer.prev
        new_trailer.next = nil
        @trailer.prev = nil
        node = @trailer
        @trailer = new_trailer
      else

        if index <= size / 2
          node_prev = @header
          (index - 1).times.each do
            node_prev = node_prev.next
          end

          node = node_prev.next
        else
          node_next = @trailer
          ((size - 1) - index).times.each do
            node_next = node_next.prev
          end

          node = node_next.prev
        end

        node_prev = node.prev
        node_next = node.next

        node.prev = nil
        node.next = nil

        node_prev.next = node_next
        node_next.prev = node_prev
      end

      @size -= 1
      node.data
    end

    # Removes element
    def remove(element)
      # TODO
    end

    # Removes all elements
    def clean
      # TODO
    end

    # Returns the first element
    def first
      @header.data
    end

    # Returns the last element
    def last
      @trailer.data
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
      current_node = @header

      while current_node
        current_node.next, current_node.prev = current_node.prev, current_node.next

        current_node = current_node.prev
      end

      @header, @trailer = @trailer, @header
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

    def valid_index?(index)
      (-size..size).cover?(index)
    end

    def remove_valid_index?(index)
      (-size..(size - 1)).cover?(index)
    end
  end
end
