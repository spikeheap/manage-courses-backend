module API
  module V2
    class ProvidersController < ApplicationController
      before_action :get_user, if: -> { params[:user_id].present? }

      def index
        authorize Provider
        providers = policy_scope(Provider)
        providers = providers.where(id: @user.providers) if @user.present?

        render jsonapi: providers
      end

    private

      def get_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
