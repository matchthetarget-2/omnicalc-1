class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calc_templates/square_form" })
  end

  def calc_square
    @new = params.fetch("user_input")
    @square = @new.to_f ** 2
    render({ :template => "calc_templates/square_results" })
  end

  def blank_square_root_form
    render({ :template => "calc_templates/square_root_form" })
  end

  def calc_square_root
    @new = params.fetch("user_input")
    @square_root = @new.to_f ** 0.5
    render({ :template => "calc_templates/square_root_results" })
  end

  def blank_random_form
    render({ :template => "calc_templates/random_form" })
  end

  def calc_random
    @low = params.fetch("low").to_f
    @high = params.fetch("high").to_f
    @random = rand(@low..@high)
    render({ :template => "calc_templates/random_results" })
  end

  def blank_payment_form
    render({ :template => "calc_templates/payment_form" })
  end

  def calc_payment
    @r = params.fetch("user_apr").to_f / 100
    @pv = params.fetch("user_pv").to_f
    @n = params.fetch("user_years").to_f * 12
    p @n
    p @r * @pv
    @payment = (@r / 12 * @pv) / (1 - ((1 + @r / 12) ** -@n))
    #@payment = (@r * (1+@r)**@n) / ( (1+@r)**@n -1 )
    render({ :template => "calc_templates/payment_results" })
  end
end
