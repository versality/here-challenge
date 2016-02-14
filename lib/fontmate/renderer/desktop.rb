require 'rmagick'
require_relative '../validation'

# Desktop renderer made for performing metrics

module FontMate
  module Renderer
    class Desktop
      include FontMate::Validation

      def initialize(font, text)
        validate_text(text)
        @font = font
        @text = text
      end

      def font_width(font_size)
        validate_font_size(font_size)
        perform(font_size)
      end

      private
      def perform(font_size)
        label            = ::Magick::Draw.new
        label.font       = @font
        label.font_style = Magick::NormalStyle
        label.pointsize  = font_size
        label.text_antialias(true)
        label.text(0,0, @text)

        metrics = label.get_type_metrics(@text)

        metrics.width
      end
    end
  end
end
