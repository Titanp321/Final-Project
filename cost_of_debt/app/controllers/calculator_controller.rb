class CalculatorController < ApplicationController

  def display
    # Pull in data from users credit cards and fixterm loans
    @ccdebts = current_user.ccdebts #pull in rows relevant to current current
    @ftdebts = current_user.ftdebts


    #month_interest_rate = @apr/1200


    interstPayments = Array.new
    principalPayments = Array.new
    @monthlyPayments = Array.new

    i=0
       @ftdebts.each do |key, ftdebt|
         i += 1
         #apr_rate = ftdebt['debt_apr']/1200

         #@monthly_payment = "Testing string #{ftdebt['accountname']}"  #this generates the string but no value from database

         #@monthlyPayments.push(ftdebt['accountname'])

      #   timeframe = ftdebt['debt_term']
      #   balance = ftdebt['debt_balance']
      #
      #   monthly_payment = balance * apr_rate/(1-(1+apr_rate)**(-1*timeframe))
      #   @monthlyPayments.push(monthly_payment)
       end

    #rate = Rate.new(0.0425, :apr, :duration => (30 * 12))
    # amortization = Amortization.new(250000, rate)
    # @totalInterest = amortization.payment

    render 'main/display'
  end
end
