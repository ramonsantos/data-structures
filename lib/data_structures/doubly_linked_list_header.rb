# frozen_string_literal: true

module DataStructures
  module DoublyLinkedListHeader
    module Insert
      def insert_at_header(element)
        increases_size
        new_node = Node.new(element)

        if @header
          @header.prev = new_node
          new_node.next = @header
        else
          @trailer = new_node
        end

        @header = new_node
      end
    end

    module Remove
      def remove_header
        new_header = @header.next
        new_header.prev = nil
        @header.next = nil
        node = @header
        @header = new_header

        decreases_size

        node.data
      end
    end

    module Data
      def header_data
        @header&.data
      end
    end
  end
end
