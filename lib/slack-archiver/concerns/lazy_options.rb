module SlackArchiver
  module LazyOptions
    extend Concern

    included do
      attr_reader :options

      def initialize(opts = {})
        @options = opts
      end
    end

  end
end
