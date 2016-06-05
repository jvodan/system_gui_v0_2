module Systems
  module Admins
    class PasswordsController < ApplicationController

      def edit
        @admin = current_user
      end

      def update
        @admin = current_user
        if @admin.update_password(strong_params)
          redirect_to new_user_session_path, notice: 'Admin user password was successfully updated. Please sign in with the new password.'
        else
          render 'edit'
        end
      end

      def strong_params
        params.require(:user).permit(:password, :password_confirmation, :current_password)
      end

    end
  end
end
