module API
  module V2
    class UsersController < ApplicationController
      def show
        user = User.find(params[:id])
        authorize user

        render jsonapi: user,
               include: params[:includes]
      end
    end
  end
end
