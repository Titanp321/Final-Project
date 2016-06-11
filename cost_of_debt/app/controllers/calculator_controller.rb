class CalculatorController < ApplicationController

  def display
    # Pull in data from users credit cards and fixterm loans
    @ccdebts = current_user.ccdebts #pull in rows relevant to current current
    @ftdebts = current_user.ftdebts

    #@monthlyPayments = @ftdebts.class
    #month_interest_rate = @apr/1200


    i=0
    apr_rate = 0  #this doesn't matter, we don't need to initalize variables

    @epr_rates = Array.new
    @monthlyPayments = Array.new
    @interstPayments = Array.new
    @principalPayments = Array.new
    @totalsPaid = Array.new


       @ftdebts.each do |ftdebt|
         i += 1


        #  The code below works!! There is something funky going on in that I can't seem to use the . methods to access the values in the hash. ASIDE: the last value from the last loop is the value that is stored in the variable.
         #@monthlyPayments.push(ftdebt['accountname'])
         apr_rate = ftdebt['debt_apr'].to_f
         timeframe = ftdebt['debt_term'].to_f
         balance = ftdebt['debt_balance'].to_f


         #Calculate the effective interest rate for the fixed term loans
         epr_rate_yearly = ((1+apr_rate/100/12)**(12)-1)*100  #this value is in percent
         epr_rate_yearly = epr_rate_yearly.round(2)
         @epr_rates.push(epr_rate_yearly)                  #this is a vector with all effective percentage rates

         #Convert APR yearly interest rate into monthly interest rate
         apr_rate_monthly = apr_rate/12     #we use the apr rate with the formula below

         #Calculate the monthly payment for each fixed term loan
         monthly_payment = balance*apr_rate_monthly/100/(1-(1+apr_rate_monthly/100)**(-1*timeframe))
         monthly_payment = monthly_payment.round(2)
         @monthlyPayments.push(monthly_payment)

         #Calculate the total amount paid
         totalPaid = (monthly_payment*timeframe).round(2)
         @totalsPaid.push(totalPaid)

         #Calculate the total interest paid by subtracting the balance of the loan
         interestPayment = (totalPaid - balance).round(2)
         @interstPayments.push(interestPayment)
       end

    #rate = Rate.new(0.0425, :apr, :duration => (30 * 12))
    # amortization = Amortization.new(250000, rate)
    # @totalInterest = amortization.payment

    render 'main/display'
  end
end
