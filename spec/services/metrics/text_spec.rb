require 'spec_helper'

RSpec.describe Metrics::Text do
  let(:font_params) do
    {
      font_name: 'OpenSans-Regular.ttf',
      font_size: 50,
      font_width: 200,
      text: 'this is text with biiiiiiiiiiiiiiiiiiiiiiiiiiiiiiig word'
    }
  end

  subject { Metrics::Text.new(font_params) }

  describe '#measure_lines' do
    let(:lines) { 5 }

    context 'given no new lines (\n)' do
      it 'should return correct number of lines' do
        expect(subject.measure_lines).to eq(lines)
      end
    end

    context 'given five additional lines (\n)' do
      it 'should return correct number of lines' do
        font_params[:text] = font_params[:text] + "\n\n\n\n\n"
        expect(subject.measure_lines).to eq(lines + 5)
      end
    end
  end

  describe '#measure_long_words' do
    context 'given one big word' do
      let(:big_word) { 'a'*20 }

      it 'returns one match' do
        font_params[:text] = big_word
        subject = Metrics::Text.new(font_params)
        expect(subject.measure_long_words).to match_array(big_word)
      end
    end

    context 'given two big word' do
      let(:big_words) { 'a'*30+' '+'b'*20 }

      it 'returns two matches' do
        font_params[:text] = big_words
        subject = Metrics::Text.new(font_params)
        big_words_array = big_words.split(' ')
        expect(subject.measure_long_words).to match_array(big_words_array)
      end
    end

    context 'given no big word' do
      it 'returns no matches' do
        font_params[:text] = 'there was only a b and c'
        subject = Metrics::Text.new(font_params)
        expect(subject.measure_long_words).to be_nil
      end
    end
  end
end
