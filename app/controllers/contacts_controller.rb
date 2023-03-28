class ContactsController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_contact, only: %i[show edit update destroy]

  # GET /contacts or /contacts.json
  def index
    @contacts = current_user.contacts
  end

  def show; end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit; end

  # POST /contacts or /contacts.json
  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      flash[:success] = 'Contato criado com sucesso.'
      redirect_to contacts_path
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    if @contact.update(contact_params)
      flash[:success] = 'Contato atualizado com sucesso'
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy
    if @contact.destroy
      flash[:success] = 'Contato removido com sucesso'
      redirect_to contacts_url
    else
      flash[:danger] = 'Contato não encontrado.'
      redirect_to contacts_url
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end
