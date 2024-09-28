module CommentsHelper
  def card(title)
    content_tag('div',
      content_tag('div', title),
      class: "card"
    )
  end
end
