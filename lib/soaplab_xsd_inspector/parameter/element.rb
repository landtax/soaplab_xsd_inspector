require 'soaplab_xsd_inspector/parameter/base'

module SoaplabXsdInspector
  module Parameter
    class Element < Base
      NS = { 'xs' => 'http://www.w3.org/2001/XMLSchema' }

      attr_reader :name, :type

      def initialize(doc_node)
        @name = doc_node[:name]
        @type = doc_node[:type].scan(/^xs:(.*)$/).flatten[0]

        super
      end

    end
  end

end
