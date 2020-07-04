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

  describe '#first' do
    it do
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
      subject.append('1')
      subject.append('2')
      subject.append('3')
      assert_equal(subject.last, '3')
      subject.append('4')
      assert_equal(subject.last, '4')
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
