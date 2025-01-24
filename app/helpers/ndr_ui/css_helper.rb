module NdrUi
  # Provides CSS helper methods
  module CssHelper
    # This method merges the specified css_classes into the options hash
    def css_class_options_merge(options, css_classes = [], &block)
      options = options.symbolize_keys
      css_classes += options[:class].split(' ') if options.include?(:class)
      yield(css_classes) if block_given?
      options[:class] = css_classes.uniq.join(' ') unless css_classes.empty?

      options
    end
  end
end
