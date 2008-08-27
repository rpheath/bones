require File.join(File.dirname(__FILE__), '..', 'lib', 'boot')

def remove_const(const)
  Object.send(:remove_const, const) if Object.const_defined?(const)
end

def force_const(const, val)
  remove_const(const)
  Object.const_set(const, val)
end

# adjust constants initially so it sees the
# factory as the default place for executing specs
force_const :ROOT,    File.expand_path(File.dirname(__FILE__) + '/factory')
force_const :PAGES,   File.join(ROOT, 'pages')
force_const :LAYOUTS, File.join(ROOT, 'layouts')