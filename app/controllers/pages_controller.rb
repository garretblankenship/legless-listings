class PagesController < ApplicationController
    def home
        render plain: "homepage"
    end
end