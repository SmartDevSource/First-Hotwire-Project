class EmailsController < ApplicationController
  
  def index
    @emails = Email.all
  end

  def create
    email = Email.new(object: Faker::Internet.email, body: Faker::Lorem.paragraph, isopen: false)

    if email.save
      redirect_to emails_path
    end
  end

  def destroy
    if (params[:id] == "destroy_all")
      Email.delete_all
      redirect_to emails_path
    else
      Email.find(params[:id]).destroy
      redirect_to emails_path
    end
  end

  def show
    @email = Email.find(params[:id])

    if (!@email.isopen)
      Email.all.update(isopen: false)
      @email.update(isopen: true)
      redirect_to emails_path
    elsif (@email.isopen)
      @email.update(isopen: false)
      redirect_to emails_path
    end
  end

end