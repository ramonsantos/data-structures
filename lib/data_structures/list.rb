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
      return insert_at_trailer(element)  if index == size
      raise(StandardError, 'IndexError') if invalid_index?(index)
      return insert_at_header(element)   if normalize_index(index).zero?

      node = find_node_by_index(index)
      do_insert_between_nodes(element, node.prev, node)
    end

    # Removes element by index
    def remove_at(index)
      raise(StandardError, 'IndexError') if invalid_index?(index)
      return remove_uniq_element         if size == 1

      index = normalize_index(index)

      if index.zero?
        remove_header
      elsif (index + 1) == size
        remove_trailer
      else
        remove_node(find_node_by_index(index))
      end
    end

    # Removes first element
    def remove(element)
      return remove_uniq_element if (size == 1) && (@header.data == element)
      return remove_header       if @header.data == element
      return remove_trailer      if @trailer.data == element

      node = find_element(element)

      raise(StandardError, 'ElementNotFound') if node.nil?

      remove_node(node)
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

    # Returns the index of first element
    def index_at(element)
      find_element(element, :index)
    end

    # Returns element by index
    def get(index)
      raise(StandardError, 'IndexError') if invalid_index?(index)

      find_node_by_index(index).data
    end

    # Sets the element at index
    def set(element, index)
      raise(StandardError, 'IndexError') if invalid_index?(index)

      find_node_by_index(index).tap { |node| node.data = element }.data
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
      !find_element(element).nil?
    end

    def inspect
      build_inspect('[]', '[', ', ', ']')
    end

    private

    def find_node_by_index(index)
      index = normalize_index(index)

      return @header if index.zero?
      return @trailer if index == (size - 1)

      if index <= size / 2
        find_node_by_index_from_header(index)
      else
        find_node_by_index_from_trailer(index)
      end
    end

    def find_node_by_index_from_header(index)
      node_prev = @header

      (index - 1).times { node_prev = node_prev.next }

      node_prev.next
    end

    def find_node_by_index_from_trailer(index)
      node_next = @trailer

      ((size - 2) - index).times { node_next = node_next.prev }

      node_next.prev
    end

    def do_insert_between_nodes(element, node_prev, node_next)
      new_node = Node.new(element)
      link_nodes(new_node, node_next)
      link_nodes(node_prev, new_node)

      increases_size
    end

    def remove_node(node)
      link_nodes(node.prev, node.next)

      unlink_node(node)

      decreases_size

      node.data
    end

    def find_element(element, returns = :node)
      index = 0
      pointer = @header

      until index == size
        return { node: pointer, index: index }[returns] if pointer.data == element

        index += 1
        pointer = pointer.next
      end
    end

    def invalid_index?(index)
      !(-size..(size - 1)).cover?(index)
    end

    def normalize_index(index)
      index % size
    end
  end
end
