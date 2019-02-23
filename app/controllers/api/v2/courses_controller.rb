module API
  module V2
    class CoursesController < ApplicationController
      def index
        provider = Provider.friendly.find(params[:provider_id])
        authorize provider, :can_list_courses?
        authorize Course

        render jsonapi: provider.courses
      end
    end
  end
end
