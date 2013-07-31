module SoaplabXsdInspector

  class InterfaceDefinition

    attr_reader :document, :documentation, :inputs, :outputs

    def initialize(xsd_description)
      @document = Nokogiri::XML(xsd_description)
      @documentation = parse_documentation
      @inputs = parse_inputs
      @outputs = parse_outputs
    end

    private

    def parse_documentation
      document.xpath("/xs:schema/xs:annotation/xs:documentation", NS).text
    end

    def parse_inputs
      SoaplabXsdInspector::ParameterList.new(document.xpath("/xs:schema/xs:complexType[@name='appInputs']", NS).first)
    end

    def parse_outputs
      SoaplabXsdInspector::ParameterList.new(document.xpath("/xs:schema/xs:complexType[@name='appResults']", NS).first)
    end

  end

end
