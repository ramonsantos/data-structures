# frozen_string_literal: true

module DataStructures
  module DoublyLinkedListHeader
    module Insert
      private

      def insert_at_header(element)
        new_node = Node.new(element)

        if empty?
          @trailer = new_node
        else
          link_nodes(new_node, header)
        end

        @header = new_node

        increases_size
      end
    end

    module Remove
      private

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
      private

      def header_data
        @header&.data
      end
    end
  end
end
