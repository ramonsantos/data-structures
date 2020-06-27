# frozen_string_literal: true

require 'minitest/autorun'
require 'data_structures'

describe DataStructures::List do
  subject { DataStructures::List.new }

  describe '#append' do
    it do
      assert_equal(subject.size, 0)
      subject.append('1')
      assert_equal(subject.size, 1)
      assert_equal(subject.inspect, '[1]')
      subject.append('2')
      assert_equal(subject.size, 2)
      assert_equal(subject.inspect, '[1, 2]')
    end
  end

  describe '#size' do
    it do
      assert_equal(subject.size, 0)
      subject.append('1')
      assert_equal(subject.size, 1)
      subject.remove_at(0)
      assert_equal(subject.size, 0)
    end
  end

  describe '#empty?' do
    it do
      assert(subject.empty?)
      subject.append('1')
      refute(subject.empty?)
    end
  end

  describe '#inspect' do
    describe 'when list empty' do
      it { assert_equal(subject.inspect, '[]') }
    end

    describe 'when list with one element' do
      before { subject.append('new element') }

      it { assert_equal(subject.inspect, '[new element]') }
    end

    describe 'when list with 5 elements' do
      before { (1..5).to_a.each { |element| subject.append(element) } }

      it { assert_equal('[1, 2, 3, 4, 5]', subject.inspect) }
    end

    describe 'when list with more than 5 elements' do
      before { (1..6).to_a.each { |element| subject.append(element) } }

      it { assert_equal('[1, 2, ..., 5, 6]', subject.inspect) }
    end
  end
end
