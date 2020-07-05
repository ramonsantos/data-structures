# frozen_string_literal: true

module DataStructures
  class List < DoublyLinkedList
    include DoublyLinkedListCommon::Remove
    include DoublyLinkedListTrailer::Insert
    include DoublyLinkedListTrailer::Remove
    include DoublyLinkedListTrailer::Data
    include DoublyLinkedListHeader::Insert
    include DoublyLinkedListHeader::Remove
    include DoublyLinkedListHeader::Data

    # Adds element to the end of the list
    def append(element)
      insert_at_trailer(element)
    end

    # Adds element at the beginning of the list
    def prepend(element)
      insert_at_header(element)
    end

    # Adds element in determined index
    def insert_at(element, index)
      raise(StandardError, 'IndexError') unless valid_index_to_insert?(index)

      if index == size || size.zero?
        insert_at_trailer(element)
      elsif index.zero?
        insert_at_header(element)
      else
        do_insert_at(element, index)
      end
    end

    # Removes element by index
    def remove_at(index)
      raise(StandardError, 'IndexError') unless valid_index?(index)

      index = (index % size)

      if size == 1
        remove_uniq_element
      elsif index.zero?
        remove_header
      elsif index == (size - 1)
        remove_trailer
      else
        do_remove_at(index)
      end
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
      header_data
    end

    # Returns the last element
    def last
      trailer_data
    end

    # Returns the index of element
    def index_at(element)
      # TODO
    end

    # Returns element by index
    def get(index)
      find_node_by_index(index)&.data
    end

    # Sets the element at index
    def set(element, index)
      node = find_node_by_index(index)
      node.data = element
      node.data
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

    # Returns true if the given element is present in list, otherwise returns false
    def include?(element)
      # TODO
    end

    def inspect
      build_inspect('[]', '[', ', ', ']')
    end

    private

    def find_node_by_index(index)
      raise(StandardError, 'IndexError') unless valid_index?(index)

      index = index % size

      return @header if index.zero?
      return @trailer if index == (size - 1)

      if index <= size / 2
        node_prev = @header

        (index - 1).times.each do
          node_prev = node_prev.next
        end

        node_prev.next
      else
        node_next = @trailer

        ((size - 2) - index).times.each do
          node_next = node_next.prev
        end

        node_next.prev
      end
    end

    def do_insert_at(element, index)
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

      increases_size
    end

    def do_remove_at(index)
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
      decreases_size
      node.data
    end

    def valid_index_to_insert?(index)
      (-size..size).cover?(index)
    end

    def valid_index?(index)
      (-size..(size - 1)).cover?(index)
    end
  end
end
