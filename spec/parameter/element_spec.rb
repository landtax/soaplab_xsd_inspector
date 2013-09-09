require 'spec_helper'

describe SoaplabXsdInspector::Parameter::Element do

    let(:definition) { SoaplabXsdInspector::InterfaceDefinition.new(:xsd_description => File.read("spec/support/example1.xsd")) }
    let(:node_element) { definition.document.xpath("//xs:element").first }

    subject { SoaplabXsdInspector::Parameter::Element.new(node_element) }

    it "must have choices and be elements" do
      expect(subject.name).to eq("input_direct_data")
      expect(subject.type).to eq("string")
    end

end
