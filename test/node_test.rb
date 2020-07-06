# frozen_string_literal: true

require './test/test_helper'
require 'data_structures'

describe DataStructures::Node do
  subject { DataStructures::Node.new('content 1') }

  let(:next_node) { DataStructures::Node.new('content 2') }
  let(:prev_node) { DataStructures::Node.new('content 0') }

  describe '#inspect' do
    describe 'when node without prev or next' do
      it { assert_equal(subject.inspect, ':{content 1}:') }
    end

    describe 'when node with prev' do
      it do
        subject.prev = prev_node
        assert_equal(subject.inspect, '{content 0} <-> :{content 1}:')
      end
    end

    describe 'when node with next' do
      it do
        subject.next = next_node
        assert_equal(subject.inspect, ':{content 1}: <-> {content 2}')
      end
    end

    describe 'when node with prev and next' do
      it do
        subject.prev = prev_node
        subject.next = next_node
        assert_equal(subject.inspect, '{content 0} <-> :{content 1}: <-> {content 2}')
      end
    end
  end
end
