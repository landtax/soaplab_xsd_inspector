require 'spec_helper'

describe SoaplabXsdInspector::ParameterList do

  describe "list of parameters" do
    let(:definition) { SoaplabXsdInspector::InterfaceDefinition.new(:xsd_description => File.read("spec/support/example1.xsd")) }

    let(:node_sequence) { definition.document.xpath("/xs:schema/xs:complexType[@name='appResults']").first }

    describe "parse of node sequence" do
      it "must create elements" do
        expect(SoaplabXsdInspector::ParameterList.new(node_sequence).size).to eq(4)
      end
    end

  end

end
