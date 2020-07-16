# frozen_string_literal: true

module DataStructures
  module DoublyLinkedListCommon
    module Remove
      private

      def remove_uniq_element
        node = @header
        @header = nil
        @trailer = nil

        decreases_size

        node.data
      end
    end
  end
end
