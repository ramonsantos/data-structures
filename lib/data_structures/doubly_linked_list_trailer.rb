# frozen_string_literal: true

module DataStructures
  module DoublyLinkedListTrailer
    module Insert
      private

      def insert_at_trailer(element)
        new_node = Node.new(element)

        if empty?
          @header = new_node
        else
          link_nodes(@trailer, new_node)
        end

        @trailer = new_node

        increases_size
      end
    end

    module Remove
      private

      def remove_trailer
        new_trailer = @trailer.prev
        new_trailer.next = nil
        @trailer.prev = nil
        node = @trailer
        @trailer = new_trailer

        decreases_size

        node.data
      end
    end

    module Data
      private

      def trailer_data
        @trailer&.data
      end
    end
  end
end
