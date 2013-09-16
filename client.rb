require './formatter.rb'
require './source.rb'
require './writer.rb'


SOURCE = 'test.java'
OUTPUT = 'result.java'

configurator = {
  'spaces_num' => 4,
  'source' => FileSource.new(SOURCE),
  'writer' => FileWriter.new(OUTPUT)
}


frmtr = JavaFormatter.new(configurator)
frmtr.format
