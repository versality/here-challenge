# General class for performing fonts metrics
# Can be extended by adding additional renderers located
# fontmate/renderers
#

module FontMate
  class Ruler
    include FontMate::Validation

    attr_writer :renderer

    def initialize
      # Default renderer
      @renderer = :desktop
    end

    def measure(font, font_size, text)
      validate_text(text)
      validate_font_size(font_size)

      rend = construct_renderer.new(font, text)
      rend.font_width(font_size)
    end

    def renderer
      @renderer.capitalize
    end

    def renderer=(renderer)
      validate_renderer(renderer)
      @renderer = renderer
    end

    private
    def construct_renderer
      Module.const_get("FontMate::Renderer::#{self.renderer}")
    end
  end
end
