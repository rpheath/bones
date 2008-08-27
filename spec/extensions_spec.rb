require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Bones extensions" do
  it "should join two strings together" do
    home = '/Users/rpheath'
    path = 'application/root'
    
    (home / path).should == "#{home}/#{path}"
  end
  
  # ...
end