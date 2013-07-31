require 'spec_helper'

describe SoaplabXsdInspector::Parameter::Choice do

    let(:definition) { SoaplabXsdInspector::InterfaceDefinition.new("spec/support/example1.xsd") }
    let(:node_choice) { definition.document.xpath("//xs:choice").first }

    subject { SoaplabXsdInspector::Parameter::Choice.new(node_choice) }

    it "must parse documentation" do
      expect(subject.documentation).to eq("list of URLs pointing to LMF files to be merged.")
    end

    it "must have choices and be elements" do
      expect(subject.choices.size).to eq(2)
      expect(subject.choices.first.class).to eq(SoaplabXsdInspector::Parameter::Element)
      expect(subject.choices.last.class).to eq(SoaplabXsdInspector::Parameter::Element)
    end

end
