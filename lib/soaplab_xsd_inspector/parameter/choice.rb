require 'soaplab_xsd_inspector/parameter/base'

module SoaplabXsdInspector

  module Parameter
    class Choice < Base

      attr_reader :choices

      def initialize(doc_node)
        @choices = doc_node.xpath("xs:element", NS).map do |element|
          SoaplabXsdInspector::ParameterFactory.make(element)
        end
        super
      end

    end
  end

end
