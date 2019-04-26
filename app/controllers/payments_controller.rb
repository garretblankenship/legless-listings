class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def stripe
        user_id = params[:data][:object][:client_reference_id]
        payment_id=  params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        listing_id = payment.metadata.listing_id
        p listing_id
        render json: ""
    end

    def success

    end
end