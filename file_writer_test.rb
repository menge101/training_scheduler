require 'minitest/autorun'
require_relative 'file_writer'

class FileWriterTest < MiniTest::Test
  def setup
    @file = MiniTest::Mock.new
    @fw = FileWriter.new(@file)
  end

  def test_persist
    @file.expect(:print, nil, ['test string'])
    assert @fw.persist('test string')
    @file.verify
  end

  def test_close
    @file.expect(:close, nil)
    @file.expect(:closed?, true)
    assert @fw.close
    @file.verify
  end
end
    
