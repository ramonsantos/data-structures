# frozen_string_literal: true

module DataStructures
  class Stack < DoublyLinkedList
    include DoublyLinkedListCommon::Remove
    include DoublyLinkedListTrailer::Insert
    include DoublyLinkedListTrailer::Remove
    include DoublyLinkedListTrailer::Data

    # Adds element
    def push(element)
      insert_at_trailer(element)
    end

    # Removes element
    def pop
      raise(StandardError, 'IndexError') if empty?

      if size == 1
        remove_uniq_element
      else
        remove_trailer
      end
    end

    # Returns the top element
    def top
      trailer_data
    end

    def inspect
      build_inspect('[', '[ ')
    end
  end
end
