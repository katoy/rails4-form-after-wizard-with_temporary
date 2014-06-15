
class TmpStepsController < ApplicationController
  include RailsTemporaryData::ControllerHelpers
  include Wicked::Wizard
  steps :step_2, :step_3

  def show
    @tmp = get_tmp_data(:tmp)
    render_wizard
  end

  def update
    @tmp = get_tmp_data(:tmp)
    set_tmp_data(:tmp, @tmp.data.merge(tmp_params))
    render_wizard @tmp
  end

  private

  def redirect_to_finish_wizard(options = nil)
    data = get_tmp_data(:tmp).data
    user = User.new(user_params(data))
    begin
      user.save!
      redirect_to root_url, notice: "Thank you for signing up."
    rescue => e
      flash[:error] = "#{e.message}"
      render_wizard @tmp
    end
  end

  private

  def tmp_params
    params.require(:temporary_data).permit(:email, :password, :password_confirmation, :name, :twitter_username, :github_username, :website, :date_of_birth, :bio)
  end

  def user_params(data)
    data.permit(:email, :password, :password_confirmation, :name, :twitter_username, :github_username, :website, :date_of_birth, :bio)
  end

end
