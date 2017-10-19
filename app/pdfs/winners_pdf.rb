class Winners_Pdf < Prawn::Document
  def initialize(categories)
     super(top_margin: 70)
    @categories = categories
    @categories.each do |category|
      text "Category Name \##{category.name}"
      @nominees = Vote.winner(category)
       @nominees.each do |nominee|
        text "Winner \##{nominee.name}"
        text "Total Votes \##{nominee.vote_count(category)}"
      end
    end
  end
end
