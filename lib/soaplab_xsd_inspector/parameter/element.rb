require 'soaplab_xsd_inspector/parameter/base'

module SoaplabXsdInspector
  module Parameter
    class Element < Base

      attr_reader :name, :type

      def initialize(doc_node)
        @name = doc_node[:name]
        @type = doc_node[:type].scan(/^xs:(.*)$/).flatten[0]

        super
      end

    end
  end

end
