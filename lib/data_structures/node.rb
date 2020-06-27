# frozen_string_literal: true

module DataStructures
  class Node
    attr_reader :data
    attr_accessor :next
    attr_accessor :prev

    def initialize(data)
      @data = data
      @next = nil
      @prev = nil
    end

    def inspect
      "#{prev_inspect_content if @prev}:{#{@data}}:#{next_inspect_content if @next}"
    end

    private

    def prev_inspect_content
      "{#{@prev&.data}} <-> "
    end

    def next_inspect_content
      " <-> {#{@next&.data}}"
    end
  end
end
