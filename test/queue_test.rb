# frozen_string_literal: true

require_relative 'support/test_helper'

describe DataStructures::Queue do
  subject { DataStructures::Queue.new }

  describe '#enqueue' do
    it do
      expect(subject.size).must_equal(0)

      subject.enqueue('1')
      expect(subject.size).must_equal(1)
      expect(subject.inspect).must_equal('<< 1')

      subject.enqueue('2')
      expect(subject.size).must_equal(2)
      expect(subject.inspect).must_equal('<< 1 | 2')

      subject.enqueue('3')
      expect(subject.size).must_equal(3)
      expect(subject.inspect).must_equal('<< 1 | 2 | 3')

      subject.dequeue
      expect(subject.inspect).must_equal('<< 2 | 3')

      subject.enqueue('4')
      expect(subject.size).must_equal(3)
      expect(subject.inspect).must_equal('<< 2 | 3 | 4')
    end
  end

  describe '#dequeue' do
    it do
      subject.enqueue('1')
      subject.enqueue('2')
      subject.enqueue('3')
      expect(subject.inspect).must_equal('<< 1 | 2 | 3')

      expect(subject.dequeue).must_equal('1')
      expect(subject.inspect).must_equal('<< 2 | 3')

      expect(subject.dequeue).must_equal('2')
      expect(subject.inspect).must_equal('<< 3')

      subject.enqueue('4')
      expect(subject.inspect).must_equal('<< 3 | 4')
      expect(subject.dequeue).must_equal('3')
      expect(subject.inspect).must_equal('<< 4')
      expect(subject.front).must_equal('4')

      expect(subject.dequeue).must_equal('4')
      expect(subject.inspect).must_equal('<<')
      expect(subject.send(:trailer)).must_be_nil
      expect(subject.front).must_be_nil

      error = expect { subject.dequeue }.must_raise StandardError
      expect(error.message).must_equal('IndexError')

      subject.enqueue('5')
      expect(subject.inspect).must_equal('<< 5')
      expect(subject.dequeue).must_equal('5')
      expect(subject.inspect).must_equal('<<')
    end
  end

  describe '#size' do
    it do
      expect(subject.size).must_equal(0)
      subject.enqueue('1')
      expect(subject.size).must_equal(1)
      subject.dequeue
      expect(subject.size).must_equal(0)
    end
  end

  describe '#empty?' do
    it do
      expect(subject.empty?).must_equal(true)
      subject.enqueue('1')
      expect(subject.empty?).must_equal(false)
      subject.dequeue
      expect(subject.empty?).must_equal(true)
    end
  end

  describe '#front' do
    it do
      expect(subject.front).must_be_nil

      subject.enqueue('1')
      expect(subject.front).must_equal('1')

      subject.enqueue('2')
      expect(subject.front).must_equal('1')

      subject.dequeue
      expect(subject.front).must_equal('2')

      subject.dequeue
      expect(subject.front).must_be_nil
    end
  end
end
