require "nokogiri"
require "pry"

module SoaplabXsdInspector

  class InterfaceDefinition

    attr_reader :document, :documentation, :inputs, :outputs

    def initialize(xsd_path)
      @document = Nokogiri::XML(File.read(xsd_path))
      @documentation = parse_documentation
      @inputs = parse_inputs
      @outputs = parse_outputs
    end

    private

    def parse_documentation
      document.xpath("/xs:schema/xs:annotation/xs:documentation", 'xs' => 'http://www.w3.org/2001/XMLSchema').text
    end

    def parse_inputs
      "inputs"
    end

    def parse_outputs
      "outputs"
    end

  end

end
