# frozen_string_literal: true

require './test/test_helper'
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

      subject.append('3')
      assert_equal(subject.size, 3)
      assert_equal(subject.inspect, '[1, 2, 3]')
    end
  end

  describe '#prepend' do
    it do
      assert_equal(subject.size, 0)

      subject.prepend('1')
      assert_equal(subject.size, 1)
      assert_equal(subject.inspect, '[1]')

      subject.prepend('2')
      assert_equal(subject.size, 2)
      assert_equal(subject.inspect, '[2, 1]')

      subject.prepend('3')
      assert_equal(subject.size, 3)
      assert_equal(subject.inspect, '[3, 2, 1]')
    end
  end

  describe '#insert_at' do
    describe 'when success' do
      it do
        assert_equal(subject.size, 0)

        subject.insert_at('1', 0)
        assert_equal(subject.size, 1)
        assert_equal(subject.inspect, '[1]')

        subject.insert_at('2', 1)
        assert_equal(subject.size, 2)
        assert_equal(subject.inspect, '[1, 2]')

        subject.insert_at('3', -1)
        assert_equal(subject.size, 3)
        assert_equal(subject.inspect, '[1, 3, 2]')

        subject.insert_at('4', 2)
        assert_equal(subject.size, 4)
        assert_equal(subject.inspect, '[1, 3, 4, 2]')

        subject.insert_at('5', -3)
        assert_equal(subject.size, 5)
        assert_equal(subject.inspect, '[1, 5, 3, 4, 2]')

        subject.insert_at('6', 4)
        assert_equal(subject.size, 6)
        assert_equal(subject.inspect, '[1, 5, 3, 4, 6, 2]')

        subject.insert_at('7', 4)
        assert_equal(subject.size, 7)
        assert_equal(subject.inspect, '[1, 5, 3, 4, 7, 6, 2]')

        subject.insert_at('8', 4)
        assert_equal(subject.size, 8)
        assert_equal(subject.inspect, '[1, 5, 3, 4, 8, 7, 6, 2]')
      end
    end

    describe 'when error' do
      it do
        error = assert_raises { subject.insert_at('1', -1) }
        assert_equal 'IndexError', error.message
        assert_raises { subject.insert_at('1', 1) }
      end
    end
  end

  describe '#remove_at' do
    describe 'when success' do
      it do
        subject.append('0')
        assert_equal(subject.size, 1)
        assert_equal(subject.remove_at(0), '0')
        assert_equal(subject.inspect, '[]')
        assert_equal(subject.size, 0)

        subject.append('1')
        subject.append('2')
        subject.append('3')
        subject.append('4')
        subject.append('5')

        assert_equal(subject.remove_at(4), '5')
        assert_equal(subject.inspect, '[1, 2, 3, 4]')
        assert_equal(subject.size, 4)

        assert_equal(subject.remove_at(0), '1')
        assert_equal(subject.inspect, '[2, 3, 4]')
        assert_equal(subject.size, 3)

        assert_equal(subject.remove_at(-2), '3')
        assert_equal(subject.inspect, '[2, 4]')
        assert_equal(subject.size, 2)

        subject.insert_at('5', 1)
        assert_equal(subject.inspect, '[2, 5, 4]')
        assert_equal(subject.remove_at(1), '5')
        assert_equal(subject.inspect, '[2, 4]')
        assert_equal(subject.size, 2)

        assert_equal(subject.remove_at(-2), '2')
        assert_equal(subject.inspect, '[4]')
        assert_equal(subject.size, 1)

        assert_equal(subject.remove_at(-1), '4')
        assert_equal(subject.inspect, '[]')
        assert_equal(subject.size, 0)
      end
    end

    describe 'when error' do
      it do
        subject.append('1')
        error = assert_raises { subject.remove_at(-2) }
        assert_equal 'IndexError', error.message
        assert_raises { subject.remove_at(1) }
      end
    end
  end

  describe '#remove' do
    describe 'when success' do
      it do
        subject.append('a')
        subject.append('b')
        subject.append('c')
        subject.append('d')
        subject.append('e')
        assert_equal(subject.inspect, '[a, b, c, d, e]')

        assert_equal(subject.remove('a'), 'a')
        assert_equal(subject.inspect, '[b, c, d, e]')
        assert_equal(subject.size, 4)

        assert_equal(subject.remove('c'), 'c')
        assert_equal(subject.inspect, '[b, d, e]')
        assert_equal(subject.size, 3)

        assert_equal(subject.remove('e'), 'e')
        assert_equal(subject.inspect, '[b, d]')
        assert_equal(subject.size, 2)

        assert_equal(subject.remove('d'), 'd')
        assert_equal(subject.inspect, '[b]')
        assert_equal(subject.size, 1)

        assert_equal(subject.remove('b'), 'b')
        assert_equal(subject.inspect, '[]')
        assert_equal(subject.size, 0)
      end
    end

    describe 'when error' do
      it do
        assert_raises { subject.remove('z') }
        subject.append('a')
        error = assert_raises { subject.remove('z') }
        assert_equal 'ElementNotFound', error.message
      end
    end
  end

  describe '#include?' do
    it do
      subject.append('a')
      subject.append('b')
      subject.append('c')
      subject.append('d')
      subject.append('e')
      subject.append('d')

      assert_equal(subject.include?('a'), true)
      assert_equal(subject.include?('d'), true)
      assert_equal(subject.include?('e'), true)
      assert_equal(subject.include?('x'), false)
    end
  end

  describe '#first' do
    it do
      assert_nil(subject.first)
      subject.append('1')
      subject.append('2')
      subject.append('3')
      assert_equal(subject.first, '1')
      subject.prepend('0')
      assert_equal(subject.first, '0')
    end
  end

  describe '#last' do
    it do
      assert_nil(subject.last)
      subject.append('1')
      subject.append('2')
      subject.append('3')
      assert_equal(subject.last, '3')
      subject.append('4')
      assert_equal(subject.last, '4')
    end
  end

  describe '#index_at' do
    it do
      assert_nil(subject.index_at('z'))
      subject.append('a')
      subject.append('b')
      subject.append('c')
      subject.append('d')
      subject.append('e')
      subject.append('d')
      assert_equal(subject.index_at('a'), 0)
      assert_equal(subject.index_at('b'), 1)
      assert_equal(subject.index_at('c'), 2)
      assert_equal(subject.index_at('d'), 3)
      assert_equal(subject.index_at('e'), 4)
      assert_nil(subject.index_at('x'))
    end
  end

  describe '#get' do
    it do
      subject.append('1')
      subject.append('2')
      subject.append('3')
      subject.append('4')
      subject.append('5')

      assert_equal(subject.get(-5), '1')
      assert_equal(subject.get(-4), '2')
      assert_equal(subject.get(-3), '3')
      assert_equal(subject.get(-2), '4')
      assert_equal(subject.get(-1), '5')
      assert_equal(subject.get(0), '1')
      assert_equal(subject.get(1), '2')
      assert_equal(subject.get(2), '3')
      assert_equal(subject.get(3), '4')
      assert_equal(subject.get(4), '5')

      error = assert_raises { subject.get(-6) }
      assert_equal 'IndexError', error.message
      assert_raises { subject.get(5) }
    end
  end

  describe '#set' do
    it do
      subject.append('1')
      subject.append('2')
      subject.append('3')
      subject.append('4')
      subject.append('5')
      subject.append('6')

      assert_equal(subject.set('a', -6), 'a')
      assert_equal(subject.set('b', -5), 'b')
      assert_equal(subject.set('c', -4), 'c')
      assert_equal(subject.set('d', -3), 'd')
      assert_equal(subject.set('e', -2), 'e')
      assert_equal(subject.set('f', -1), 'f')
      assert_equal(subject.set('a', 0), 'a')
      assert_equal(subject.set('b', 1), 'b')
      assert_equal(subject.set('c', 2), 'c')
      assert_equal(subject.set('d', 3), 'd')
      assert_equal(subject.set('f', 4), 'f')
      assert_equal(subject.set('g', 5), 'g')

      error = assert_raises { subject.set('h', -7) }
      assert_equal 'IndexError', error.message
      assert_raises { subject.set('h', 6) }
    end
  end

  describe '#revert' do
    it do
      subject.revert
      assert_equal(subject.inspect, '[]')
      subject.append('1')
      subject.revert
      assert_equal(subject.inspect, '[1]')
      subject.append('2')
      subject.append('3')
      subject.append('4')
      assert_equal(subject.inspect, '[1, 2, 3, 4]')
      subject.revert
      assert_equal(subject.inspect, '[4, 3, 2, 1]')
      subject.append('5')
      assert_equal(subject.inspect, '[4, 3, 2, 1, 5]')
      subject.revert
      assert_equal(subject.inspect, '[5, 1, 2, 3, 4]')
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
end
