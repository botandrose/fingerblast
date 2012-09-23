# require 'ruby-debug'

module CucumberRailsDebug
  def where
    puts page.current_url
  end

  def how
    # puts @request.parameters.inspect 
  end

  def html
    puts page.body.gsub("\n", "\n            ")
  end

  def display(decoration="\n#{'*' * 80}\n\n")
    puts decoration
    yield
    puts decoration 
  end
end

World(CucumberRailsDebug)
