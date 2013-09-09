require 'spec_helper'

describe SoaplabXsdInspector::ParameterFactory do

  describe "factory for creating parameters" do
    let(:definition) { SoaplabXsdInspector::InterfaceDefinition.new(:xsd_description => File.read("spec/support/example1.xsd")) }

    let(:node_choice) { definition.document.xpath("//xs:choice").first }
    let(:node_element) { definition.document.xpath("//xs:element").first }


    describe "generation of objects" do
      it "must create choices" do
        expect(SoaplabXsdInspector::ParameterFactory.make(node_choice).class).to eq(SoaplabXsdInspector::Parameter::Choice)
      end
      it "must create element basic params" do
        expect(SoaplabXsdInspector::ParameterFactory.make(node_element).class).to eq(SoaplabXsdInspector::Parameter::Element)
      end
    end

  end

end
