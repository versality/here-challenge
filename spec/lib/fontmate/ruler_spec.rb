require 'spec_helper'

RSpec.describe FontMate::Ruler do
  let(:fontmate_ruller) { FontMate::Ruler.new }
  let(:font_path) { Metrics::Font.new.path_by_name('OpenSans-Regular.ttf') }

  context 'having set \'Desktop\' renderer' do
    let(:renderer) { :desktop }

    describe '#measure' do
      it 'returns correct width' do
        fontmate_ruller.renderer = renderer
        text_width = fontmate_ruller.measure(font_path, 50, 'this is text')

        expect(text_width).to eq(237.25)
      end
    end
  end
end
