module SoaplabXsdInspector
  module Parameter
    class Base
      attr_reader :documentation

      def initialize(doc_node)
        @doc_node = doc_node
        @documentation = parse_documentation
      end

      private

      def parse_documentation
        @doc_node.xpath("xs:annotation/xs:documentation").text
      end

    end
  end

end
