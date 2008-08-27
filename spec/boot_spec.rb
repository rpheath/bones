require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Bones booter" do
  it "should return directories under a given path" do
    directories(ROOT / 'public').
      should eql(['/images', '/javascripts', '/stylesheets', '/v1', '/v2'])
  end
  
  it "should return all page directories" do
    page_directories.should eql(['/partials'])
  end
  
  it "should return all versioned directories" do
    versioned_directories.should eql(['/v1', '/v2'])
  end
  
  it "should return all public (asset) directories" do
    public_directories.should eql(['/images', '/javascripts', '/stylesheets'])
  end
end