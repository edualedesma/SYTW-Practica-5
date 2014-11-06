require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"
require "minitest/pride"
require 'chartkick'




class TestChartkick < MiniTest::Unit::TestCase
  include Chartkick::Helper

  def setup
    @data = [[11, 22], [33, 44], [55,66]]
  end

  def test_line_chart
    assert line_chart(@data)
  end

  def test_pie_chart
    assert pie_chart(@data)
  end

  def test_column_chart
    assert column_chart(@data)
  end

  def test_options_not_mutated
    options = {id: "boom"}
    line_chart @data, options
    assert_equal "boom", options[:id]
  end

end
