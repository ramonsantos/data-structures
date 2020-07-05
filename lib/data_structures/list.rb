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
      return insert_at_trailer(element) if index == size
      raise(StandardError, 'IndexError') if invalid_index?(index)
      return insert_at_header(element) if (index % size).zero?

      node = find_node_by_index(index)
      do_insert_between_nodes(element, node.prev, node)
    end

    # Removes element by index
    def remove_at(index)
      raise(StandardError, 'IndexError') if invalid_index?(index)
      return remove_uniq_element if size == 1
      return remove_header if (index % size).zero?
      return remove_trailer if (index % size) + 1 == size

      node = find_node_by_index(index)
      remove_node(node)
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
      raise(StandardError, 'IndexError') if invalid_index?(index)

      find_node_by_index(index)&.data
    end

    # Sets the element at index
    def set(element, index)
      raise(StandardError, 'IndexError') if invalid_index?(index)

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

    def do_insert_between_nodes(element, node_prev, node_next)
      increases_size

      new_node = Node.new(element)

      new_node.prev = node_prev
      new_node.next = node_next

      node_prev.next = new_node
      node_next.prev = new_node
    end

    def remove_node(node)
      decreases_size

      node_prev = node.prev
      node_next = node.next

      node.prev = nil
      node.next = nil

      node_prev.next = node_next
      node_next.prev = node_prev
      node.data
    end

    def invalid_index?(index)
      !(-size..(size - 1)).cover?(index)
    end
  end
end
