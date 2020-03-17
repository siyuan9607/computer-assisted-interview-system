class User < ActiveRecord::Base
      def self.role
          return ['supervisor','interviewer']
      end
end
