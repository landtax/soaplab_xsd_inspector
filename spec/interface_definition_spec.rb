require 'net/http'
require 'uri'
require 'spec_helper'

describe SoaplabXsdInspector::InterfaceDefinition do
  let(:xsd_content) { File.read("spec/support/example1.xsd") }
  let(:wsdl_content) { File.read("spec/support/example1.wsdl") }

  describe "interface attributes" do

    let(:definition) { SoaplabXsdInspector::InterfaceDefinition.new(:xsd_description => xsd_content) }

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

  describe "wsdl methods" do

    it "must find the xsd url well" do
      definition = SoaplabXsdInspector::InterfaceDefinition.new({})
      url = definition.send(:find_xsd_url, wsdl_content)
      expect(url).to eq("http://ws03.iula.upf.edu:80/soaplab2-axis/typed/services/lexicon_terminology_extraction.merge_list_of_lmf_files?xsd=1")
    end

    it "must download xsd and initialize" do
      Net::HTTP.should_receive(:get).and_return(xsd_content)
      definition = SoaplabXsdInspector::InterfaceDefinition.new(:wsdl_description => wsdl_content)
      expect(definition.outputs.size).to eq(4)
    end

  end

end
