# frozen_string_literal: true

require './test/test_helper'
require 'data_structures'

describe DataStructures::Stack do
  subject { DataStructures::Stack.new }

  describe '#push' do
    it do
      assert_equal(subject.size, 0)

      subject.push('1')
      assert_equal(subject.size, 1)
      assert_equal(subject.inspect, '[ 1')

      subject.push('2')
      assert_equal(subject.size, 2)
      assert_equal(subject.inspect, '[ 1 | 2')

      subject.push('3')
      assert_equal(subject.size, 3)
      assert_equal(subject.inspect, '[ 1 | 2 | 3')

      subject.pop
      assert_equal(subject.inspect, '[ 1 | 2')

      subject.push('4')
      assert_equal(subject.size, 3)
      assert_equal(subject.inspect, '[ 1 | 2 | 4')
    end
  end

  describe '#pop' do
    it do
      subject.push('1')
      subject.push('2')
      subject.push('3')
      assert_equal(subject.inspect, '[ 1 | 2 | 3')

      assert_equal(subject.pop, '3')
      assert_equal(subject.inspect, '[ 1 | 2')

      assert_equal(subject.pop, '2')
      assert_equal(subject.inspect, '[ 1')

      subject.push('4')
      assert_equal(subject.inspect, '[ 1 | 4')
      assert_equal(subject.pop, '4')
      assert_equal(subject.inspect, '[ 1')

      assert_equal(subject.pop, '1')
      assert_equal(subject.inspect, '[')

      error = assert_raises { subject.pop }
      assert_equal 'IndexError', error.message

      subject.push('5')
      assert_equal(subject.inspect, '[ 5')
      assert_equal(subject.pop, '5')
      assert_equal(subject.inspect, '[')
    end
  end

  describe '#size' do
    it do
      assert_equal(subject.size, 0)
      subject.push('1')
      assert_equal(subject.size, 1)
      subject.pop
      assert_equal(subject.size, 0)
    end
  end

  describe '#empty?' do
    it do
      assert(subject.empty?)
      subject.push('1')
      refute(subject.empty?)
      subject.pop
      assert(subject.empty?)
    end
  end

  describe '#top' do
    it do
      assert_nil(subject.top)

      subject.push('1')
      assert_equal(subject.top, '1')

      subject.push('2')
      assert_equal(subject.top, '2')

      subject.pop
      assert_equal(subject.top, '1')

      subject.pop
      assert_nil(subject.top)
    end
  end
end
