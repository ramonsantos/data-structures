# frozen_string_literal: true

module DataStructures
  module BuildInspect
    private

    def build_inspect(empty, open_with, separator = ' | ', close_with = '')
      return empty if empty?

      "#{open_with}#{inspect_content(separator)}#{close_with}"
    end

    def inspect_content(separator)
      return header.data if header == @trailer

      pointer = header.next
      result = header.data.to_s

      until pointer.nil?
        result += "#{separator}#{pointer.data}"

        pointer = pointer.next
      end

      result
    end
  end
end
