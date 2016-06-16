class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :delete]
  
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: "Message has been saved"
    else
      @messages = Message.all
      flash.now[:alert] = "Message could not be saved"
      render 'index'
    end
  end
  
  def edit
    @message = Message.find(params[:id])
  end
  
  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to root_path, notice: "Message has been edited"
    else
      render 'edit'
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to root_path, notice: "Message has been deleted"
  end

  private
  def message_params
    params.require(:message).permit(:name, :body, :age)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
end
