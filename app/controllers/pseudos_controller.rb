class PseudosController < ApplicationController
  before_action :set_pseudo, only: %i[ show edit update destroy choisir ]
  protect_from_forgery except:[:choisir,:quitter]

  # GET /pseudos or /pseudos.json
  def index
    @pseudos = Pseudo.all
  end
  def choisir
        current_user.update(pseudo_id:@pseudo.id)
        UserAppearanceJob.perform_now(@pseudo,current_user)
  end
  def quitter
        current_user.update(pseudo_id:nil)
        QuitPseudoJob.perform_now(current_user)
  end

  # GET /pseudos/1 or /pseudos/1.json
  def show
  end

  # GET /pseudos/new
  def new
    @pseudo = Pseudo.new({user_id: current_user.try(:id)})
  end

  # GET /pseudos/1/edit
  def edit
  end

  # POST /pseudos or /pseudos.json
  def create
    @pseudo = Pseudo.new(pseudo_params)


    respond_to do |format|
      if @pseudo.save
        current_user.update(pseudo_id:@pseudo.id)
        UserAppearanceJob.perform_now(@pseudo,current_user)
        format.html { redirect_to pseudo_url(@pseudo), notice: "Pseudo was successfully created." }
        format.json { render :show, status: :created, location: @pseudo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pseudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pseudos/1 or /pseudos/1.json
  def update
    respond_to do |format|
      if @pseudo.update(pseudo_params)
        current_user.update(pseudo_id:@pseudo.id)
        PseudoJob.perform_now(@pseudo,current_user)
        UserAppearanceJob.perform_now(@pseudo,current_user)
        format.html { redirect_to pseudo_url(@pseudo), notice: "Pseudo was successfully updated." }
        format.json { render :show, status: :ok, location: @pseudo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pseudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pseudos/1 or /pseudos/1.json
  def destroy
    @pseudo.destroy

    respond_to do |format|
      format.html { redirect_to pseudos_url, notice: "Pseudo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pseudo
      @pseudo = Pseudo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pseudo_params
      params.require(:pseudo).permit(:user_id, :name, :body,:image)
    end
end
