module NdrUi
  module Bootstrap
    # Allows a form to be marked as read-only. Supported field helpers
    # render as a non-editable display instead, allowing a form to be
    # reused as a "show" template.
    #
    # Most helpers have a similar signature, so can be iterated over and
    # enhanced. The reminaining minority have to be manually re-defined.
    module Readonly
      def self.included(base)
        # These have different signatures, or aren't affected by `readonly`:
        not_affected = [:fields_for]
        needs_custom = [:label, :radio_button, :file_field, :hidden_field] +
                       base.field_helpers_from_form_options_helper

        (base.field_helpers - needs_custom - not_affected).each do |selector|
          class_eval <<-END, __FILE__, __LINE__ + 1
            def #{selector}(method, options = {}, *rest)
              return super unless readonly?
              readonly_value = options.symbolize_keys.fetch(:readonly_value, object.send(method))
              @template.content_tag(:p, readonly_value, class: 'form-control-static')
            end
          END
        end

        [:select, :time_zone_select].each do |selector|
          class_eval <<-END, __FILE__, __LINE__ + 1
            def #{selector}(method, _something, options = {}, *rest)
              return super unless readonly?
              readonly_value = options.symbolize_keys.fetch(:readonly_value, object.send(method))
              @template.content_tag(:p, readonly_value, class: 'form-control-static')
            end
          END
        end

        [:collection_select, :collection_check_boxes, :collection_radio_buttons].each do |selector|
          class_eval <<-END, __FILE__, __LINE__ + 1
            def #{selector}(method, collection, value_method, text_method, options = {}, *rest)
              return super unless readonly?
              readonly_value = options.symbolize_keys.fetch(:readonly_value, object.send(method))
              @template.content_tag(:p, readonly_value, class: 'form-control-static')
            end
          END
        end

        class_eval <<-END, __FILE__, __LINE__ + 1
          # grouped_collection_select takes many other arguments
          def grouped_collection_select(method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
            return super unless readonly?
            readonly_value = options.symbolize_keys.fetch(:readonly_value, object.send(method))
            @template.content_tag(:p, readonly_value, class: 'form-control-static')
          end

          # For labels, the for attribute should be removed:
          def label(method, text = nil, **options, &block)
            return super unless readonly?
            super(object_name, method, options.merge(for: nil), &block)
          end

          # radio_button takes another intermediate argument:
          def radio_button(method, tag_value, options = {})
            return super unless readonly?
            readonly_value = options.symbolize_keys.fetch(:readonly_value, object.send(method))
            @template.content_tag(:p, readonly_value, class: 'form-control-static')
          end

          # For file_field, the readonly value defaults to nil:
          def file_field(method, options = {})
            return super unless readonly?
            readonly_value = options.symbolize_keys[:readonly_value]
            @template.content_tag(:p, readonly_value, class: 'form-control-static')
          end

          # Hidden fields should be suppressed when the form is readonly:
          def hidden_field(*)
            super unless readonly?
          end
        END

        class_eval <<-END, __FILE__, __LINE__ + 1
          # Allow fields_for to inherit `readonly`:
          def fields_for(record_name, record_object = nil, fields_options = {}, &block)
            fields_options[:readonly] ||= readonly
            super
          end
        END
      end

      attr_accessor :readonly
      alias readonly? readonly

      def initialize(*)
        super

        self.readonly = options[:readonly]
      end
    end
  end
end
