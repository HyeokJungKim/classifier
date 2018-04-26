class QuotesController < ApplicationController

  def index
  end

  def classify
    render "classify.html.erb"
  end

  def categorize
    quotes = Quote.all
    classifier = ClassifierReborn::Bayes.new('Harry Potter','Marvel')
    quotes.each do |quote|
      classifier.train("#{quote.category}", "#{quote.content}")
    end
    @category = classifier.classify(quote_params[:content])
    render "category.html.erb"
  end

  private
  def quote_params
    params.permit(:content)
  end
end
