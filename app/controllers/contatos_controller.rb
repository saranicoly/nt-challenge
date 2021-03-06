class ContatosController < ApplicationController
  before_action :set_contato, only: %i[ show edit update destroy ]

  # GET /contatos or /contatos.json
  def index
    @contatos = Contato.all
  end

  # GET /contatos/1 or /contatos/1.json
  def show
  end

  # GET /contatos/new
  def new
    @contato = Contato.new
  end

  # GET /contatos/1/edit
  def edit
  end

  # POST /contatos or /contatos.json
  def create
    @contato = Contato.new(contato_params)

    config_hubspot_post

    respond_to do |format|
      if @contato.save
        format.html { redirect_to contato_url(@contato), notice: "Contato was successfully created." }
        format.json { render :show, status: :created, location: @contato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contatos/1 or /contatos/1.json
  def update
    respond_to do |format|
      if @contato.update(contato_params)
        format.html { redirect_to contato_url(@contato), notice: "Contato was successfully updated." }
        format.json { render :show, status: :ok, location: @contato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contatos/1 or /contatos/1.json
  def destroy
    @contato.destroy

    respond_to do |format|
      format.html { redirect_to contatos_url, notice: "Contato was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_contato
      @contato = Contato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contato_params
      params.require(:contato).permit(:email, :phone_number, :birthday, :weight)
    end

    def config_hubspot_post
      properties = {
        "email": @contato.email,
        "phone_number": @contato.phone_number,
        "birthday": @contato.birthday,
        "weight": @contato.weight
      }

      simple_public_object_input = Hubspot::Crm::Contacts::SimplePublicObjectInput.new(properties: properties)
      begin
        api_response = Hubspot::Crm::Contacts::BasicApi.new.create(simple_public_object_input, auth_names: "oauth2")
        puts api_response
      rescue Hubspot::Crm::Contacts::ApiError => e
        error_message = JSON.parse(e.response_body)['message']
        puts error_message
      end
    end
end
