module Systems
  module Admins
    class EmailsController < ApplicationController

      def edit
        @admin = current_user
      end

      def update
        @admin = current_user
        if @admin.update_email(strong_params)
          sign_in :user, @admin, bypass: true
          redirect_to system_path, notice: 'Admin user email address was successfully updated.'
        else
          render 'edit'
        end
      end

      def strong_params
        params.require(:user).permit(:email, :password)
      end

    end
  end
end
