require 'spec_helper'
require 'import/dc_parser'

describe DcParser do
  subject { DcParser.from_xml(sample_dc) }

  describe '#to_attrs_hash - happy path' do
    let(:sample_dc) { fixture_file('files/weaedm186-DC.xml').read }
    let(:attrs_hash) { subject.to_attrs_hash }

    it 'returns a hash of attributes and values' do
      expect(attrs_hash[:title]).to eq ["A Qualitative Examination of the Antecedents and Consequences of Accreditation of Nonprofit Organizations"]
      expect(attrs_hash[:description].first).to match /Several nonprofit umbrella associations/
      expect(attrs_hash[:rights].first).to match /including but not limited to commercial or scholarly reproductions, redistribution, publication or transmission/

      expect(attrs_hash[:content_format]).to eq ['application/pdf', '37 p']
      expect(attrs_hash[:creator]).to eq ['Slatten, Lise Anne D.']
      expect(attrs_hash[:date]).to eq ['2007-12']
      expect(attrs_hash[:language]).to eq ['eng']
      expect(attrs_hash[:publisher]).to be_nil
      expect(attrs_hash[:relation]).to eq ['Doctorate of Management Programs']
      expect(attrs_hash[:subject]).to eq ['Accreditation', 'Nonprofit organizations--Management--Evaluation']
      expect(attrs_hash[:type]).to eq ['text']
    end
  end

  describe '#to_attrs_hash - error with single-value fields' do
    let(:sample_dc) { fixture_file('files/bundy-DC.xml').read }

    it 'raises an error' do
      message = "Multiple values were found for single-value field: description"
      expect { subject.to_attrs_hash }.to raise_error(message)
    end
  end
end
