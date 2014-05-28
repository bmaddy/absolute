require 'spec_helper'

describe "The table, column and index names that don't work with Oracle (> 30 bytes)" do
  let(:file) { File.read('db/schema.rb') }
  subject { file.split(/\W/).select { |a| a.size > 30 } }
  it { should eq [] }
end
