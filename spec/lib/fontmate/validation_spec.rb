require 'spec_helper'

RSpec.describe FontMate::Validation do
  describe FontMate::Ruler do
    let(:fontmate_ruller) { FontMate::Ruler.new }
    let(:font_path) { Metrics::Font.new.path_by_name('OpenSans-Regular.ttf') }
    let(:renderer) { :desktop }

    context 'given wrong font size' do
      it 'should raise an exception' do
        fontmate_ruller.renderer = renderer
        expect {
          fontmate_ruller.measure(font_path, '50', 'this is text')
        }.to raise_error(TypeError)
      end
    end

    context 'given wrong text format' do
      it 'should raise an exception' do
        fontmate_ruller.renderer = renderer
        expect {
          fontmate_ruller.measure(font_path, 50, 1337)
        }.to raise_error(TypeError)
      end
    end

    context 'given wrong renderer' do
      it 'should raise an exception' do
        expect {
          fontmate_ruller.renderer = :potato
        }.to raise_error(RendererIncorrect)
      end
    end
  end
end
