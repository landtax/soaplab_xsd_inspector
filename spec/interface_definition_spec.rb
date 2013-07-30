require 'spec_helper'

describe SoaplabXsdInspector::InterfaceDefinition do

  describe "interface attributes" do

    subject { SoaplabXsdInspector::InterfaceDefinition.new("spec/support/example1.xsd") }

    it "must have documentation" do
      expect(subject.documentation).to eq("input/output types for 'merge_list_of_lmf_files' Web Service")
    end

    it "must have inputs" do
      expect(subject.inputs).not_to be_empty
    end

    it "must have outputs" do
      expect(subject.description).to be_empty
    end

  end

end
