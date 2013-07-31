require 'spec_helper'

describe SoaplabXsdInspector::Parameter::Base do

    let(:definition) { SoaplabXsdInspector::InterfaceDefinition.new("spec/support/example1.xsd") }
    let(:node_choice) { definition.document.xpath("//xs:choice").first }

    subject { SoaplabXsdInspector::Parameter::Base.new(node_choice) }

    it "must parse documentation" do
      expect(subject.documentation).to eq("list of URLs pointing to LMF files to be merged.")
    end

end
