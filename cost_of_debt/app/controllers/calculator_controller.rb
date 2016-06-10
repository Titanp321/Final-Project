class CalculatorController < ApplicationController
require 'finance'

  def display
    # Pull in data from users credit cards and fixterm loans
    @ccdebts = current_user.ccdebts #pull in rows relevant to current current
    @ftdebts = current_user.ftdebts


    #month_interest_rate = @apr/1200



      @ftdebts.each do |ftdebt|
        i += 0 
        apr_rate = ftdebt.debt_apr/100
        timeframe = ftdebt.debt_term
        balance = ftdebt.debt_balance

        monthly_payment = balance * apr_rate/(1-(1+apr_rate)**(-1*timeframe))
        @monthly_payment = monthly_payment +


        @totalInterest = 10
      end

    #rate = Rate.new(0.0425, :apr, :duration => (30 * 12))
    # amortization = Amortization.new(250000, rate)
    # @totalInterest = amortization.payment

    render 'main/display'
  end
end
