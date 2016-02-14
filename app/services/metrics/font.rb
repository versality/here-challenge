class FontMissing < StandardError; end

# Support class for easier fonts servings throughout Metrics classes

module Metrics
  class Font
    def initialize
      perform_index
    end

    def perform_index
      @fonts = {}

      font_paths = Dir[APP_ROOT.join('vendor', 'fonts', '*')]
      font_paths.each do |font_path|
        font_name = File.basename(font_path)
        @fonts[font_name] = font_path
      end
    end

    def path_by_name(font)
      if @fonts.has_key?(font)
        @fonts[font]
      else
        raise FontMissing, 'Requested font has not been found.'
      end
    end
  end
end
