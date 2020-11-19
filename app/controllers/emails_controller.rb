class EmailsController < ApplicationController
  def index
    @emails = Email.all
    @email = Email.new()
  end

  def create
    email_object = Faker::Games::Zelda.game
    email_body = Faker::Movies::PrincessBride.quote
    @email = Email.new(object: email_object, body: email_body)

    if @email.save
      respond_to do |format|
        format.html do
          redirect_to emails_path 
        end
        format.js { }
      end
      flash[:success] = "Email received with success !"
    else
      flash[:danger] = "Couldn't create !"
      redirect_to emails_path
    end
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end
    
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html do
        flash[:success] = "Email n°#{@email.id} deleted successfully"
        redirect_to root_path
      end
      format.js { }
    end
  end
end
