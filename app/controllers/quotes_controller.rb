class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.ordered
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
















# Le code ci-dessous ne fonctionne pas j'ai donc laissé l'ancien
# ____________________________________________________________


# class QuotesController < ApplicationController
#   # ...

#   def create
#     @quote = Quote.new(quote_params)

#     if @quote.save
#       redirect_to quotes_path, notice: "Quote was successfully created."
#     else
#       # Add `status: :unprocessable_entity` here
#       render :new, status: :unprocessable_entity
#     end
#   end

#   # ...

#   def update
#     if @quote.update(quote_params)
#       redirect_to quotes_path, notice: "Quote was successfully updated."
#     else
#       # Add `status: :unprocessable_entity` here
#       render :edit, status: :unprocessable_entity
#     end
#   end

#   # ...
# end

# ____________________________________________________________
