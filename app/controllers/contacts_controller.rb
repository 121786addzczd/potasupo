class ContactsController < ApplicationController
  before_action :move_to_index,except: [:new, :thanks]
  before_action :admin_user, only: [:index]

  def index
    @contacts = Contact.all.order('created_at DESC')
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to thanks_contacts_path
    else
      render :new
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end

