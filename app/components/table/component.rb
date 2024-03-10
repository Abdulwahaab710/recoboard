# frozen_string_literal: true

module Table
  class Component < ApplicationComponent
    attr_reader :columns
    def initialize(data:, sortable: false)
      @rows = data
      @columns = []
      @sortable_columns = []
    end

    def column(label, sortable: nil, sort_key: nil, &block)
      @columns << Column.new(label, sortable: sortable, sort_key: sort_key, params: params, request: request, &block)
      @sortable_columns << (sort_key&.to_s || label.downcase) if sortable
    end

    private

    def sorted_data
      return @rows unless sort_column
      return @rows unless @sortable_columns.include?(sort_column)
      return @rows unless sort_direction.in?(['asc', 'desc'])

      @rows.order(Hash[sort_column.to_sym, sort_direction])
    end

    def sort_column
      @sort_column ||= params[:sort_col]&.downcase
    end

    def sort_direction
      @sort_direction ||= params[:sort_direction]
    end

    def before_render
      content
    end

    class Column
      attr_reader :label, :td_block

      def initialize(label, sortable: false, sort_key:, params:, request:, &block)
        @label = label
        @sortable = sortable
        @td_block = block
        @params = params
        @request = request
        @sort_key = sort_key
      end

      def sortable?
        @sortable
      end

      def sort_path
        return unless sortable?
        return build_sort_path(label, direction: 'asc') if sort_column != sort_key
        return build_sort_path(label, direction: 'desc') if sort_column == sort_key && sort_direction == 'asc'

        build_sort_path(label, direction: 'asc')
      end

      def sort_icon
        return :unsorted unless sort_column == sort_key

        if sort_direction == 'asc'
          :asc
        else
          :desc
        end
      end

      private

      attr_reader :params, :request

      def sort_column
        @sort_column ||= params[:sort_col]&.downcase
      end

      def sort_direction
        @sort_direction ||= params[:sort_direction]
      end

      def build_sort_path(column, direction: 'asc')
        request.params.merge(sort_col: sort_key, sort_direction: direction)
      end

      def sort_key
        @sort_key&.to_s || label.downcase
      end
    end
  end
end
