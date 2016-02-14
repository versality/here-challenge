class RendererIncorrect < StandardError; end

# General validations for FontMate
#

module FontMate
  module Validation
    def validate_font_size(font_size)
      unless font_size.is_a? Fixnum
        raise(
          TypeError,
          "Font size should be an Fixnum, but given #{font_size.class}"
        )
      end
    end

    def validate_text(text)
      unless text.is_a? String
        raise(
          TypeError,
          "Font text should be a string, but given #{text.class}"
        )
      end
    end

    def validate_renderer(renderer)
      renderers = []

      renderers_path = Dir[APP_ROOT.join('lib', 'fontmate', 'renderer', '*.rb')]
      renderers_path.each do |renderer_path|
        extn = File.extname(renderer_path)
        renderers << File.basename(renderer_path, extn).to_sym
      end

      unless renderers.include?(renderer)
        raise RendererIncorrect, "Cannot match '#{renderer}' renderer."
      end
    end
  end
end
