# frozen_string_literal: true

module DataStructures
  class DoublyLinkedList
    include BuildInspect

    protected

    attr_accessor :header
    attr_accessor :trailer

    def initialize
      @size    = 0
      @header  = nil
      @trailer = nil
    end

    public

    # Returns the size of list
    def size
      @size
    end

    # Returns true if list contains no elements, otherwise returns false
    def empty?
      size.zero?
    end

    private

    def increases_size
      @size += 1
    end

    def decreases_size
      @size -= 1
    end
  end
end
