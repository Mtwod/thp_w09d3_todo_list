class EmailsController < ApplicationController
  def index
    @emails = Email.all.sort
    @email = Email.new()
  end

  def create
    email_object = Faker::Games::Zelda.game
    email_body = Faker::Movies::PrincessBride.quote
    @email = Email.new(object: email_object, body: email_body, read: false)

    if @email.save
      respond_to do |format|
        format.html do
          flash[:success] = "Email received with success !"
          redirect_to emails_path 
        end
        format.js { }
      end
    else
      flash[:danger] = "Couldn't create !"
      redirect_to emails_path
    end
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true) if @email.read == false
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.read ? @email.update(read: false) : @email.update(read:true)
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
