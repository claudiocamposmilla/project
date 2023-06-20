class StaticPagesController < ApplicationController
    def home
        if current_user.normal?
          render "normal_index"
        else
          render "admin_index"
        end
      end
  end
