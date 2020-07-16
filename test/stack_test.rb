# frozen_string_literal: true

require_relative 'support/test_helper'

describe DataStructures::Stack do
  subject { DataStructures::Stack.new }

  describe '#push' do
    it do
      expect(subject.size).must_equal(0)

      subject.push('1')
      expect(subject.size).must_equal(1)
      expect(subject.inspect).must_equal('[ 1')

      subject.push('2')
      expect(subject.size).must_equal(2)
      expect(subject.inspect).must_equal('[ 1 | 2')

      subject.push('3')
      expect(subject.size).must_equal(3)
      expect(subject.inspect).must_equal('[ 1 | 2 | 3')

      subject.pop
      expect(subject.inspect).must_equal('[ 1 | 2')

      subject.push('4')
      expect(subject.size).must_equal(3)
      expect(subject.inspect).must_equal('[ 1 | 2 | 4')
    end
  end

  describe '#pop' do
    it do
      subject.push('1')
      subject.push('2')
      subject.push('3')
      expect(subject.inspect).must_equal('[ 1 | 2 | 3')

      expect(subject.pop).must_equal('3')
      expect(subject.inspect).must_equal('[ 1 | 2')

      expect(subject.pop).must_equal('2')
      expect(subject.inspect).must_equal('[ 1')

      subject.push('4')
      expect(subject.inspect).must_equal('[ 1 | 4')
      expect(subject.pop).must_equal('4')
      expect(subject.inspect).must_equal('[ 1')

      expect(subject.pop).must_equal('1')
      expect(subject.inspect).must_equal('[')

      error = expect { subject.pop }.must_raise StandardError
      expect(error.message).must_equal('IndexError')

      subject.push('5')
      expect(subject.inspect).must_equal('[ 5')
      expect(subject.pop).must_equal('5')
      expect(subject.inspect).must_equal('[')
    end
  end

  describe '#size' do
    it do
      expect(subject.size).must_equal(0)
      subject.push('1')
      expect(subject.size).must_equal(1)
      subject.pop
      expect(subject.size).must_equal(0)
    end
  end

  describe '#empty?' do
    it do
      expect(subject.empty?).must_equal(true)
      subject.push('1')
      expect(subject.empty?).must_equal(false)
      subject.pop
      expect(subject.empty?).must_equal(true)
    end
  end

  describe '#top' do
    it do
      expect(subject.top).must_be_nil

      subject.push('1')
      expect(subject.top).must_equal('1')

      subject.push('2')
      expect(subject.top).must_equal('2')

      subject.pop
      expect(subject.top).must_equal('1')

      subject.pop
      expect(subject.top).must_be_nil
    end
  end
end
