# frozen_string_literal: true

require_relative 'support/test_helper'

describe DataStructures::Node do
  subject { DataStructures::Node.new('content 1') }

  let(:next_node) { DataStructures::Node.new('content 2') }
  let(:prev_node) { DataStructures::Node.new('content 0') }

  describe '#inspect' do
    describe 'when node without prev or next' do
      it { expect(subject.inspect).must_equal(':{content 1}:') }
    end

    describe 'when node with prev' do
      it do
        subject.prev = prev_node
        expect(subject.inspect).must_equal('{content 0} <-> :{content 1}:')
      end
    end

    describe 'when node with next' do
      it do
        subject.next = next_node
        expect(subject.inspect).must_equal(':{content 1}: <-> {content 2}')
      end
    end

    describe 'when node with prev and next' do
      it do
        subject.prev = prev_node
        subject.next = next_node
        expect(subject.inspect).must_equal('{content 0} <-> :{content 1}: <-> {content 2}')
      end
    end
  end
end
