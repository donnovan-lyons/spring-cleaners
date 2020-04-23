class ConversationsController < ApplicationController
    before_action :require_login
    
    def index
        if current_user.sub_class == "Cleaner"
            @users = current_user.type.customers.map{|customer| customer.user}.uniq
        else
            @users = current_user.type.cleaners.map{|cleaner| cleaner.user}.uniq
        end
        @conversations = Conversation.all
    end

    def new
        if Conversation.between(params[:sender_id],params[:recipient_id]).present?
            @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
            redirect_to conversation_messages_path(@conversation)
        else
            @conversation = Conversation.new(conversation_params)
            @message = @conversation.messages.new
        end
    end
    
    def create
        if params[:conversation][:body] != ""
            @conversation = Conversation.create(sender_id: params[:conversation][:sender_id], recipient_id: params[:conversation][:recipient_id])

            @message = @conversation.messages.create(body: params[:conversation][:body], user_id: params[:conversation][:sender_id])
            redirect_to conversation_messages_path(@conversation)
        else
            @conversation = Conversation.new(conversation_params)
            render :new
        end
    end

    private
    
    def conversation_params
        params.permit(:sender_id, :recipient_id, :body)
    end
    
end
