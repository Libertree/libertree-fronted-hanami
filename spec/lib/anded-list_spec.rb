describe Libertree::AndedList do
  describe '#to_s' do
    subject {
      described_class.new(array).to_s
    }

    context '[nil input]' do
      let(:array) { nil }

      it 'raises an exception' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context '[empty array input]' do
      let(:array) { [] }

      it 'returns an empty string' do
        expect(subject).to eq ""
      end
    end

    context '[given a single element array]' do
      let(:array) { ['foo'] }

      it 'returns the element' do
        expect(subject).to eq 'foo'
      end
    end

    context '[given an array of 2 elements]' do
      let(:array) { ['foo', 'bar'] }

      it 'returns the elements joined by a conjunction' do
        expect(subject).to eq 'foo and bar'
      end
    end

    context '[given an array of 3 elements]' do
      let(:array) { ['foo', 'bar', 'baz'] }

      it 'returns the elements joined by commas and one conjunction' do
        expect(subject).to eq 'foo, bar and baz'
      end
    end

    context '[given an array of 4 elements]' do
      let(:array) { ['foo', 'bar', 'baz', 'fin'] }

      it 'returns the elements joined by commas and one conjunction' do
        expect(subject).to eq 'foo, bar, baz and fin'
      end
    end
  end
end
