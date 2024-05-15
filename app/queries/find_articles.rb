class FindArticles

    attr_reader :articles

    def initialize(articles = initial_scope)
      @articles = articles
    end

    def call(params ={})
      scoped = articles
      scoped = filter_by_category_id(scoped, params[:category_id])
      scoped = filter_by_max_quantity(scoped, params[:max_quantity])
      scoped = filter_by_min_quantity(scoped, params[:min_quantity])
      scoped = filter_by_query_text(scoped, params[:query_text])
      sort(scoped, params[:order_by])

    end

    private

    def initial_scope
        Article.sti_name
    end

    def filter_by_category_id(scoped, category_id)
      return scoped unless  category_id.present?

      scoped.where(category_id: category_id)
    end

    def filter_by_max_quantity(scoped, max_quantity)
        return scoped unless max_quantity.present?
        
        scoped.where("quantity <= ?", max_quantity)
    end

    def filter_by_min_quantity(scoped, min_quantity)
      return scoped unless min_quantity.present?
      
      scoped.where("quantity >= ?", min_quantity)
  end

    def filter_by_query_text(scoped, query_text)
      return scoped unless query_text.present?
  
      scoped.search_full_text(query_text)
    end
  

    def sort(scoped, order_by)
      order_by_query = Article::ORDER_BY.fetch(order_by&.to_sym, Article::ORDER_BY[:recent])
      scoped.order(order_by_query)
    end

end
