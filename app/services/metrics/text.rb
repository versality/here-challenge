module Metrics
  class Text
    def initialize(font_params)
      metrics_font = Metrics::Font.new
      @font        = metrics_font.path_by_name(font_params[:font_name])
      @font_size   = font_params[:font_size].to_i
      @width       = font_params[:font_width].to_i
      @text        = decode_newline(font_params[:text])
    end

    def measure_lines
      line_progress = ''
      lines = 1

      @text.each_char do |char|
        line_progress += char
        measured_width = measure(line_progress)

        if measured_width >= @width || char.eql?("\n")
          lines += 1
          line_progress.clear
        end
      end

      lines
    end

    def measure_long_words
      long_words = []

      @text.split(' ').each do |word|
        measured_width = measure(word)

        if measured_width > @width
          long_words << word
        end
      end

      long_words.empty? ? nil : long_words
    end

    private
    def measure(text = @text)
      @fontmate_ruler ||= FontMate::Ruler.new
      @fontmate_ruler.measure(@font, @font_size, text)
    end

    def decode_newline(text)
      text.gsub('\\n', "\n")
    end
  end
end
