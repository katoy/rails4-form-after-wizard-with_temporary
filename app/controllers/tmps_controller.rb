class TmpsController < ApplicationController

  include ::RailsTemporaryData::ControllerHelpers

  # GET /tmps/1
  # GET /tmps/1.json
  def show
  end

  # GET /tmps/new
  def new
    set_tmp_data(:tmp, {})
    @tmp = TemporaryData.find(session[:tmp])
  end

  # POST /tmps
  # POST /tmps.json
  def create
    ret = false
    begin
      @tmp = set_tmp_data(:tmp, tmp_params)
      ret = true
    rescue => e
      @tmp = get_tmp_data(:tmp)
      @tmp.errors[:base] << "#{e.message}"
    end

    if ret
      redirect_to tmp_steps_path
    else
      render :new
    end
  end

  # PATCH/PUT /tmps/1
  # PATCH/PUT /tmps/1.json
  def update
    respond_to do |format|
      @tmp = get_tmp_data(:tmp)
      if set_tmp_data(:tmp, @tmp.data.merge(tmp_params))
        format.html { redirect_to tmp_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @tmp.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def tmp_params
    params.require(:temporary_data).permit(:email, :password, :password_confirmation, :name, :twitter_username, :github_username, :website, :date_of_birth, :bio)
  end
end
