require 'soaplab_xsd_inspector/parameter/choice'
require 'soaplab_xsd_inspector/parameter/base'
require 'soaplab_xsd_inspector/parameter/element'

module SoaplabXsdInspector

  class ParameterFactory

    def self.make(doc_node)
      class_type = doc_node.name.to_s.capitalize

      case class_type
      when "Element"
        SoaplabXsdInspector::Parameter::Element.new doc_node
      when "Choice"
        SoaplabXsdInspector::Parameter::Choice.new doc_node
      else
        raise "Incorrect parameter type"
      end
    end

  end

end
