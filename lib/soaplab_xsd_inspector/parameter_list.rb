module SoaplabXsdInspector

  class ParameterList < Array

    def initialize(doc_inputs)
      super([])
      @doc_inputs = doc_inputs
      parse_inputs
    end

    private

    def parse_inputs
      nodes = @doc_inputs.xpath("xs:sequence/*")
      nodes.each { |input| 
        self << ParameterFactory.make(input)
      }
    end

  end

end
