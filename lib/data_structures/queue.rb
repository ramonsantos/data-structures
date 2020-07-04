# frozen_string_literal: true

module DataStructures
  class Queue < LinearDataStructure
    # Adds element
    def enqueue(element)
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
    def dequeue
      raise(StandardError, 'IndexError') if empty?

      if size == 1
        node = @header
        @header = nil
        @trailer = nil
      else
        new_header = @header.next
        new_header.prev = nil
        @header.next = nil
        node = @header
        @header = new_header
      end

      decreases_size
      node.data
    end

    # Returns the top element
    def front
      @header&.data
    end

    def inspect
      build_inspect('<<', '<< ')
    end
  end
end
