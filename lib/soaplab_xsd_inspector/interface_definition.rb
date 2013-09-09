require 'pry'
require 'net/http'
require 'uri'

module SoaplabXsdInspector

  class InterfaceDefinition

    attr_reader :document, :documentation, :inputs, :outputs

    def initialize(args)
      options = args.dup

      if options[:xsd_description]
        initialize_from_soaplab_xsd(options[:xsd_description])
      elsif options[:wsdl_description]
        initialize_from_soaplab_wsdl(options[:wsdl_description])
      end
    end


    private

    def initialize_from_soaplab_wsdl(wsdl_description)
      xsd_description_url = find_xsd_url(wsdl_description)
      xsd_description = fetch_xsd(xsd_description_url)
      initialize_from_soaplab_xsd(xsd_description)
    end

    def initialize_from_soaplab_xsd(xsd_description)
      @document = Nokogiri::XML(xsd_description)
      @documentation = parse_documentation
      @inputs = parse_inputs
      @outputs = parse_outputs
    end

    def find_xsd_url(wsdl_description)
      wsdl = Nokogiri::XML(wsdl_description)
      wsdl.xpath("//xsd:schema/xsd:import").first['schemaLocation']
    end

    def parse_documentation
      document.xpath("/xs:schema/xs:annotation/xs:documentation").text
    end

    def parse_inputs
      SoaplabXsdInspector::ParameterList.new(document.xpath("/xs:schema/xs:complexType[@name='appInputs']").first)
    end

    def parse_outputs
      SoaplabXsdInspector::ParameterList.new(document.xpath("/xs:schema/xs:complexType[@name='appResults']").first)
    end

    def fetch_xsd(xsd_description_url)
      Net::HTTP.get(URI.parse(xsd_description_url))
    end

  end

end
