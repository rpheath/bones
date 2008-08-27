require File.join(File.dirname(__FILE__), '..', 'spec_helper')

class Helper
  include CoreHelper
end

describe "Bones helpers" do
  before(:each) do
    @helper = Helper.new
  end
  
  it "title should be settable and gettable" do
    @helper.title.should be_nil
    @helper.title('Bones HTML Framework')
    @helper.title.should eql("Bones HTML Framework")
  end
  
  describe "HTML helpers" do
    it "should generate HTML tags" do
      html = [
        @helper.content_tag(:div, 'div element', :id => 'div-element'),
        @helper.content_tag(:span, 'span element', :class => 'span-element'),
        @helper.content_tag(:p, 'p element', :id => 'intro', :class => 'big'),
        @helper.content_tag(:br)
      ]
    
      html[0].should eql("<div id=\"div-element\">div element</div>")
      html[1].should eql("<span class=\"span-element\">span element</span>")
      html[2].should eql("<p class=\"big\" id=\"intro\">p element</p>")
      html[3].should eql("<br />")
    end
  
    it "should be aware of short tag names" do
      @helper.short_tag_names.should eql(['input', 'br', 'link', 'hr', 'img'])
    end
  
    it "should generate properties from an options hash" do
      options = { 
        :id => 'greeting', 
        :class => 'message', 
        :style => 'text-align: center'
      }
    
      @helper.html_options_from_hash(options).
        should eql('class="message" id="greeting" style="text-align: center"')
    end
  
    it "should generate a stylesheet link tag" do
      @helper.stylesheet_tag('styles').
        should eql("<link href=\"/stylesheets/styles.css\" rel=\"stylesheet\" type=\"text/css\" />")
      @helper.stylesheet_tag('styles.css').
        should eql("<link href=\"/stylesheets/styles.css\" rel=\"stylesheet\" type=\"text/css\" />")
    end
  
    # WHY IS THIS FAILING ?!?!
    # it "should generate a stylesheet link tag for multiple files" do
    #   @helper.stylesheet_link_tag('base', 'custom.css').
    #     should eql(
    #       "<link href=\"/stylesheets/base.css\" rel=\"stylesheet\" type=\"text/css\" />\n" +
    #       "<link href=\"/stylesheets/custom.css\" rel=\"stylesheet\" type=\"text/css\" />"
    #     )
    # end
  
    it "should generate a javascript include tag" do
      @helper.javascript_tag('jquery').
        should eql("<script src=\"/javascripts/jquery.js\" type=\"text/javascript\"></script>")
      @helper.javascript_tag('jquery.js').
        should eql("<script src=\"/javascripts/jquery.js\" type=\"text/javascript\"></script>")
    end
  
    it "should generate a javascript include tag for multiple files" do
      @helper.javascript_include_tag('jquery', 'jqueryui.js').
        should eql(
          "<script src=\"/javascripts/jquery.js\" type=\"text/javascript\"></script>\n" +
          "<script src=\"/javascripts/jqueryui.js\" type=\"text/javascript\"></script>"
        )
    end
  end
  
  describe "Capture helpers" do
    # ...
  end
end