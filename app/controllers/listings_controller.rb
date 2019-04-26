class ListingsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show] 
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user, only: [:edit, :update, :destroy]
    before_action :set_breeds_and_sexes, only: [:new, :edit]

    def create
        #create new listing
        @listing = current_user.listings.create(listing_params)
        
        if @listing.errors.any?
            set_breeds_and_sexes
            render "new"
        else
            redirect_to listings_path
        end
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
    end

    def show
        stripe_session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
            name: @listing.title,
            description: @listing.description,
            amount: @listing.deposit,
            currency: 'aud',
            quantity: 1,
        }],
        success_url: 'http://localhost:3000/success',
        cancel_url: 'http://localhost:3000/cancel'
        )
        @stripe_session_id = stripe_session.id
        #view a single listing
    end

    private

    def set_breeds_and_sexes
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
    end
    
    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

    def authorize_user
        if @listing.user_id != current_user.id
            redirect_to listings_path
        end
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet, :picture)
    end
end