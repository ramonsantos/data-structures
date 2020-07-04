# frozen_string_literal: true

require 'minitest/autorun'
require 'data_structures'

describe DataStructures::Queue do
  subject { DataStructures::Queue.new }

  describe '#enqueue' do
    it do
      assert_equal(subject.size, 0)

      subject.enqueue('1')
      assert_equal(subject.size, 1)
      assert_equal(subject.inspect, '<< 1')

      subject.enqueue('2')
      assert_equal(subject.size, 2)
      assert_equal(subject.inspect, '<< 1 | 2')

      subject.enqueue('3')
      assert_equal(subject.size, 3)
      assert_equal(subject.inspect, '<< 1 | 2 | 3')

      subject.dequeue
      assert_equal(subject.inspect, '<< 2 | 3')

      subject.enqueue('4')
      assert_equal(subject.size, 3)
      assert_equal(subject.inspect, '<< 2 | 3 | 4')
    end
  end

  describe '#dequeue' do
    it do
      subject.enqueue('1')
      subject.enqueue('2')
      subject.enqueue('3')
      assert_equal(subject.inspect, '<< 1 | 2 | 3')

      assert_equal(subject.dequeue, '1')
      assert_equal(subject.inspect, '<< 2 | 3')

      assert_equal(subject.dequeue, '2')
      assert_equal(subject.inspect, '<< 3')

      subject.enqueue('4')
      assert_equal(subject.inspect, '<< 3 | 4')
      assert_equal(subject.dequeue, '3')
      assert_equal(subject.inspect, '<< 4')

      assert_equal(subject.dequeue, '4')
      assert_equal(subject.inspect, '<<')

      error = assert_raises { subject.dequeue }
      assert_equal 'IndexError', error.message

      subject.enqueue('5')
      assert_equal(subject.inspect, '<< 5')
      assert_equal(subject.dequeue, '5')
      assert_equal(subject.inspect, '<<')
    end
  end

  describe '#size' do
    it do
      assert_equal(subject.size, 0)
      subject.enqueue('1')
      assert_equal(subject.size, 1)
      subject.dequeue
      assert_equal(subject.size, 0)
    end
  end

  describe '#empty?' do
    it do
      assert(subject.empty?)
      subject.enqueue('1')
      refute(subject.empty?)
      subject.dequeue
      assert(subject.empty?)
    end
  end

  describe '#front' do
    it do
      assert_nil(subject.front)

      subject.enqueue('1')
      assert_equal(subject.front, '1')

      subject.enqueue('2')
      assert_equal(subject.front, '1')

      subject.dequeue
      assert_equal(subject.front, '2')

      subject.dequeue
      assert_nil(subject.front)
    end
  end
end
