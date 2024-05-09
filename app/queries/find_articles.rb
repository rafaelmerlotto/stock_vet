class FindArticles

    attr_reader :articles

    def initialize(articles = initial_scope)
      @articles = articles
    end

    def call(params ={})
      scoped = articles
      scoped = entry(scoped, params[:quantity])
    end

    private

    def initial_scope
        Article.with_quantity
    end

    def entry(scoped, quantity)
        return scoped unless  quantity.present?

        scoped.joins(quantity += 1)
    end
end
