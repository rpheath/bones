require File.join(File.dirname(__FILE__), 'spec_helper')

describe Bones do
  it "should return an array of pages" do
    pages = Bones.pages
    
    pages.should be_kind_of(Array)
    pages.size.should == 2
    pages.should eql(['about', 'index'])
  end
  
  describe Bones::Template do
    # ...
  end
  
  describe Bones::Versioned do
    # ...
  end
end