module ArticlesHelper
  def belongs_to_current_author?(article)
    article.author_id == current_author.id
  end
end
