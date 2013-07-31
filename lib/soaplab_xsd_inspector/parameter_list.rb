require "nokogiri"
require "pry"

module SoaplabXsdInspector

  NS = {'xs' => 'http://www.w3.org/2001/XMLSchema'}

  class ParameterList < Array

    def initialize(doc_inputs)
      super([])
      @doc_inputs = doc_inputs
      parse_inputs
    end

    private

    def parse_inputs
      nodes = @doc_inputs.xpath("xs:sequence/*", NS)
      nodes.each { |input| 
        self << ParameterFactory.make(input)
      }
    end

  end

end
