class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    
    def create
        #create new listing
        @listing = Listing.create(listing_params)
        byebug
    end


    def update
        #updates the current listing
    end

    def index
        #shows all listings
        @listings = Listing.all
    end

    def edit
        #show the edit form
    end

    def destroy
        #deletes current listing
    end

    def new
        #shows form for creating a new listing
        @listing = Listing.new
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
    end

    def show
        #view a single listing
    end

    private

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet)
    end
end