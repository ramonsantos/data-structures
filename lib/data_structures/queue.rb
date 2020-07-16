# frozen_string_literal: true

module DataStructures
  class Queue < DoublyLinkedList
    include DoublyLinkedListCommon::Remove
    include DoublyLinkedListTrailer::Insert
    include DoublyLinkedListHeader::Remove
    include DoublyLinkedListHeader::Data

    # Adds element
    def enqueue(element)
      insert_at_trailer(element)
    end

    # Removes element
    def dequeue
      raise(StandardError, 'IndexError') if empty?

      size == 1 ? remove_uniq_element : remove_header
    end

    # Returns the top element
    def front
      header_data
    end

    def inspect
      build_inspect('<<', '<< ')
    end
  end
end
