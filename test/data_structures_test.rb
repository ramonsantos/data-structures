# frozen_string_literal: true

require 'minitest/autorun'
require 'data_structures'

class DataStructuresTest < Minitest::Test
  def test_main
    assert_equal(DataStructures.main, :ok)
  end
end
