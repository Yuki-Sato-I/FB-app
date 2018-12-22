class ContactsController < ApplicationController
  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "お問い合わせを送信しました."
      redirect_to '/contacts/new'
    else
      render 'new'
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name,:content,:email)
    end
end
