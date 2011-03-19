module ReportsHelper
  def load_inputs(f)
    render "shared/anonym_user", :target => f
  end
end
