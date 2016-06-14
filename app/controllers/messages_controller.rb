class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update]
  
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: "Your message has been saved"
    else
      @messages = Message.all
      flash.now[:alert] = "Your message could not be saved"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
end
