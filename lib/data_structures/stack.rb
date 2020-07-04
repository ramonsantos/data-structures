# frozen_string_literal: true

module DataStructures
  class Stack < LinearDataStructure
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

      increases_size
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

      decreases_size
      node.data
    end

    # Returns the top element
    def top
      @trailer&.data
    end

    def inspect
      build_inspect('[', '[ ')
    end
  end
end
