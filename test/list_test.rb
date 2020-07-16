# frozen_string_literal: true

require_relative 'support/test_helper'

describe DataStructures::List do
  subject { DataStructures::List.new }

  describe '#append' do
    it do
      expect(subject.size).must_equal(0)

      subject.append('1')
      expect(subject.size).must_equal(1)
      expect(subject.inspect).must_equal('[1]')

      subject.append('2')
      expect(subject.size).must_equal(2)
      expect(subject.inspect).must_equal('[1, 2]')

      subject.append('3')
      expect(subject.size).must_equal(3)
      expect(subject.inspect).must_equal('[1, 2, 3]')
    end
  end

  describe '#prepend' do
    it do
      expect(subject.size).must_equal(0)

      subject.prepend('1')
      expect(subject.size).must_equal(1)
      expect(subject.inspect).must_equal('[1]')

      subject.prepend('2')
      expect(subject.size).must_equal(2)
      expect(subject.inspect).must_equal('[2, 1]')

      subject.prepend('3')
      expect(subject.size).must_equal(3)
      expect(subject.inspect).must_equal('[3, 2, 1]')
    end
  end

  describe '#insert_at' do
    describe 'when success' do
      it do
        expect(subject.size).must_equal(0)

        subject.insert_at('1', 0)
        expect(subject.size).must_equal(1)
        expect(subject.inspect).must_equal('[1]')

        subject.insert_at('2', 1)
        expect(subject.size).must_equal(2)
        expect(subject.inspect).must_equal('[1, 2]')

        subject.insert_at('3', -1)
        expect(subject.size).must_equal(3)
        expect(subject.inspect).must_equal('[1, 3, 2]')

        subject.insert_at('4', 2)
        expect(subject.size).must_equal(4)
        expect(subject.inspect).must_equal('[1, 3, 4, 2]')

        subject.insert_at('5', -3)
        expect(subject.size).must_equal(5)
        expect(subject.inspect).must_equal('[1, 5, 3, 4, 2]')

        subject.insert_at('6', 4)
        expect(subject.size).must_equal(6)
        expect(subject.inspect).must_equal('[1, 5, 3, 4, 6, 2]')

        subject.insert_at('7', 4)
        expect(subject.size).must_equal(7)
        expect(subject.inspect).must_equal('[1, 5, 3, 4, 7, 6, 2]')

        subject.insert_at('8', 4)
        expect(subject.size).must_equal(8)
        expect(subject.inspect).must_equal('[1, 5, 3, 4, 8, 7, 6, 2]')
      end
    end

    describe 'when error' do
      it do
        error = expect { subject.insert_at('1', -1) }.must_raise StandardError
        expect(error.message).must_equal('IndexError')
        expect { subject.insert_at('1', 1) }.must_raise StandardError
      end
    end
  end

  describe '#remove_at' do
    describe 'when success' do
      it do
        subject.append('0')
        expect(subject.size).must_equal(1)
        expect(subject.remove_at(0)).must_equal('0')
        expect(subject.inspect).must_equal('[]')
        expect(subject.size).must_equal(0)

        subject.append('1')
        subject.append('2')
        subject.append('3')
        subject.append('4')
        subject.append('5')

        expect(subject.remove_at(4)).must_equal('5')
        expect(subject.inspect).must_equal('[1, 2, 3, 4]')
        expect(subject.size).must_equal(4)

        expect(subject.remove_at(0)).must_equal('1')
        expect(subject.inspect).must_equal('[2, 3, 4]')
        expect(subject.size).must_equal(3)

        expect(subject.remove_at(-2)).must_equal('3')
        expect(subject.inspect).must_equal('[2, 4]')
        expect(subject.size).must_equal(2)

        subject.insert_at('5', 1)
        expect(subject.remove_at(1)).must_equal('5')
        expect(subject.inspect).must_equal('[2, 4]')
        expect(subject.size).must_equal(2)

        expect(subject.remove_at(-2)).must_equal('2')
        expect(subject.inspect).must_equal('[4]')
        expect(subject.size).must_equal(1)

        expect(subject.remove_at(-1)).must_equal('4')
        expect(subject.inspect).must_equal('[]')
        expect(subject.size).must_equal(0)
      end
    end

    describe 'when error' do
      it do
        subject.append('1')
        error = expect { subject.remove_at(-2) }.must_raise StandardError
        expect(error.message).must_equal('IndexError')
        expect { subject.remove_at(1) }.must_raise StandardError
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
        expect(subject.inspect).must_equal('[a, b, c, d, e]')

        expect(subject.remove('a')).must_equal('a')
        expect(subject.inspect).must_equal('[b, c, d, e]')
        expect(subject.size).must_equal(4)

        expect(subject.remove('c')).must_equal('c')
        expect(subject.inspect).must_equal('[b, d, e]')
        expect(subject.size).must_equal(3)

        expect(subject.remove('e')).must_equal('e')
        expect(subject.inspect).must_equal('[b, d]')
        expect(subject.size).must_equal(2)

        expect(subject.remove('d')).must_equal('d')
        expect(subject.inspect).must_equal('[b]')
        expect(subject.size).must_equal(1)

        expect(subject.remove('b')).must_equal('b')
        expect(subject.inspect).must_equal('[]')
        expect(subject.size).must_equal(0)
      end
    end

    describe 'when error' do
      it do
        expect { subject.remove('z') }.must_raise StandardError
        subject.append('a')

        error = expect { subject.remove('z') }.must_raise StandardError
        expect(error.message).must_equal('ElementNotFound')
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

      expect(subject.include?('a')).must_equal(true)
      expect(subject.include?('d')).must_equal(true)
      expect(subject.include?('e')).must_equal(true)
      expect(subject.include?('x')).must_equal(false)
    end
  end

  describe '#first' do
    it do
      expect(subject.first).must_be_nil
      subject.append('1')
      subject.append('2')
      subject.append('3')
      expect(subject.first).must_equal('1')
      subject.prepend('0')
      expect(subject.first).must_equal('0')
    end
  end

  describe '#last' do
    it do
      expect(subject.last).must_be_nil
      subject.append('1')
      subject.append('2')
      subject.append('3')
      expect(subject.last).must_equal('3')
      subject.append('4')
      expect(subject.last).must_equal('4')
    end
  end

  describe '#index_at' do
    it do
      expect(subject.index_at('z')).must_be_nil
      subject.append('a')
      subject.append('b')
      subject.append('c')
      subject.append('d')
      subject.append('e')
      subject.append('d')
      expect(subject.index_at('a')).must_equal(0)
      expect(subject.index_at('b')).must_equal(1)
      expect(subject.index_at('c')).must_equal(2)
      expect(subject.index_at('d')).must_equal(3)
      expect(subject.index_at('e')).must_equal(4)
      expect(subject.index_at('x')).must_be_nil
    end
  end

  describe '#get' do
    it do
      subject.append('1')
      subject.append('2')
      subject.append('3')
      subject.append('4')
      subject.append('5')

      expect(subject.get(-5)).must_equal('1')
      expect(subject.get(-4)).must_equal('2')
      expect(subject.get(-3)).must_equal('3')
      expect(subject.get(-2)).must_equal('4')
      expect(subject.get(-1)).must_equal('5')
      expect(subject.get(0)).must_equal('1')
      expect(subject.get(1)).must_equal('2')
      expect(subject.get(2)).must_equal('3')
      expect(subject.get(3)).must_equal('4')
      expect(subject.get(4)).must_equal('5')

      error = expect { subject.get(-6) }.must_raise StandardError
      expect(error.message).must_equal('IndexError')
      expect { subject.get(5) }.must_raise StandardError
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

      expect(subject.set('a', -6)).must_equal('a')
      expect(subject.set('b', -5)).must_equal('b')
      expect(subject.set('c', -4)).must_equal('c')
      expect(subject.set('d', -3)).must_equal('d')
      expect(subject.set('e', -2)).must_equal('e')
      expect(subject.set('f', -1)).must_equal('f')
      expect(subject.set('a', 0)).must_equal('a')
      expect(subject.set('b', 1)).must_equal('b')
      expect(subject.set('c', 2)).must_equal('c')
      expect(subject.set('d', 3)).must_equal('d')
      expect(subject.set('f', 4)).must_equal('f')
      expect(subject.set('g', 5)).must_equal('g')

      error = expect { subject.set('h', -7) }.must_raise StandardError
      expect(error.message).must_equal('IndexError')

      expect { subject.set('h', 6) }.must_raise StandardError
    end
  end

  describe '#revert' do
    it do
      subject.revert
      expect(subject.inspect).must_equal('[]')
      subject.append('1')
      subject.revert
      expect(subject.inspect).must_equal('[1]')
      subject.append('2')
      subject.append('3')
      subject.append('4')
      expect(subject.inspect).must_equal('[1, 2, 3, 4]')
      subject.revert
      expect(subject.inspect).must_equal('[4, 3, 2, 1]')
      subject.append('5')
      expect(subject.inspect).must_equal('[4, 3, 2, 1, 5]')
      subject.revert
      expect(subject.inspect).must_equal('[5, 1, 2, 3, 4]')
    end
  end

  describe '#size' do
    it do
      expect(subject.size).must_equal(0)
      subject.append('1')
      expect(subject.size).must_equal(1)
      subject.remove_at(0)
      expect(subject.size).must_equal(0)
    end
  end

  describe '#empty?' do
    it do
      expect(subject.empty?).must_equal(true)
      subject.append('1')
      expect(subject.empty?).must_equal(false)
    end
  end
end
