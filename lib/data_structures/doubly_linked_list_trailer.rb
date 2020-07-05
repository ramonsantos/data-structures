# frozen_string_literal: true

module DataStructures
  module DoublyLinkedListTrailer
    module Insert
      def insert_at_trailer(element)
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
    end

    module Remove
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
      def trailer_data
        @trailer&.data
      end
    end
  end
end
