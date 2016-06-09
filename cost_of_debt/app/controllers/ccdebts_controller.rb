class CcdebtsController < ApplicationController
  def index
    @ccdebts = current_user.ccdebts
  end

  def show
    @ccdebt = Ccdebt.find(params[:id])
  end

  def new
    @ccdebt = Ccdebt.new
  end

  def create
    @ccdebt = Ccdebt.new
    @ccdebt.accountname = params[:accountname]
    @ccdebt.debt_apr = params[:debt_apr]
    @ccdebt.debt_balance = params[:debt_balance]
    @ccdebt.debt_term = params[:debt_term]
    @ccdebt.user_id = params[:user_id]

    if @ccdebt.save
      redirect_to "/ccdebts", :notice => "Ccdebt created successfully."
    else
      render 'new'
    end
  end

  def edit
    @ccdebt = Ccdebt.find(params[:id])
  end

  def update
    @ccdebt = Ccdebt.find(params[:id])

    @ccdebt.accountname = params[:accountname]
    @ccdebt.debt_apr = params[:debt_apr]
    @ccdebt.debt_balance = params[:debt_balance]
    @ccdebt.debt_term = params[:debt_term]
    @ccdebt.user_id = params[:user_id]

    if @ccdebt.save
      redirect_to "/ccdebts", :notice => "Ccdebt updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @ccdebt = Ccdebt.find(params[:id])

    @ccdebt.destroy

    redirect_to "/ccdebts", :notice => "Ccdebt deleted."
  end
end
