class CalculatorController < ApplicationController

  def display
    # Pull in data from users credit cards and fixterm loans
    @ccdebts = current_user.ccdebts #pull in rows relevant to current current
    @ftdebts = current_user.ftdebts

    #@monthlyPayments = @ftdebts.class
    #month_interest_rate = @apr/1200


    interstPayments = Array.new
    principalPayments = Array.new
    @monthlyPayments = Array.new


    i=0
    apr_rate = 0  #this doesn't matter, we don't need to initalize variables

       @ftdebts.each do |ftdebt|
         i += 2


        #  The code below works!! There is something funky going on in that I can't seem to use the . methods to access the values in the hash. ASIDE: the last value from the last loop is the value that is stored in the variable.
         #@monthlyPayments.push(ftdebt['accountname'])
         apr_rate = ftdebt['debt_apr'].to_f
         timeframe = ftdebt['debt_term'].to_f
         balance = ftdebt['debt_balance'].to_f
         @monthlyPayments.push(apr_rate, timeframe,balance)
         #@monthlyPayments = balance*apr_rate

       #monthly_payment = balance*apr_rate/(1-(1+apr_rate)**(-1*timeframe))
      #   @monthlyPayments.push(monthly_payment)
       end

    #rate = Rate.new(0.0425, :apr, :duration => (30 * 12))
    # amortization = Amortization.new(250000, rate)
    # @totalInterest = amortization.payment

    render 'main/display'
  end
end
