require 'spec_helper'

describe SoaplabXsdInspector::InterfaceDefinition do

  describe "interface attributes" do

    let(:definition) { SoaplabXsdInspector::InterfaceDefinition.new("spec/support/example1.xsd") }

    it "must have documentation" do
      expect(definition.documentation).to eq("input/output types for 'merge_list_of_lmf_files' Web Service")
    end

    describe "interface inputs" do
      subject { definition.inputs }

      it "must have inputs" do
        expect(subject).not_to be_empty
      end
    end

    describe "interface outputs" do
      subject { definition.outputs }

      it "must have outputs" do
        expect(subject.size).to eq(4)
      end

    end


  end

end
