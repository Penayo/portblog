module ApplicationHelper
  # will produce next html example
  # <div class="page-title">
  #   <div class="container d-lg-flex justify-content-between align-items-center">
  #     <h1 class="mb-2 mb-lg-0"></h1>
  #     <nav class="breadcrumbs">
  #       <div class="col">
  #         <div class="d-flex flex-row-reverse">
  #           <div class="p-2">
  #             <%= link_to 'Destroy', article_path(@article), data: { turbo_method: :delete, turbo_confirm: "Are you sure?" } %>
  #           </div>
  #           <div class="p-2">
  #             <%= link_to 'Edit Article', edit_article_path(@article) %>
  #           </div>
  #         </div>
  #       </div>
  #     </nav>
  #   </div>
  # </div>
  # @param title [String], The title of the page
  # @param block [Proc], The blog for acction links

  def page_title(title: "", &block)
    content = capture(&block)

    title = tag.div class: "page-title" do 
      tag.div class: "container d-lg-flex justify-content-between align-items-center" do
        concat tag.h1 title

        concat(tag.nav(class: "breadcrumbs") do
          tag.div class: "col" do
            tag.div class: "d-flex flex-row-reverse" do
              concat(content)
            end
          end
        end)
      end
    end
  end

  # this method will embed the code from the partial
  def youtube_video(url)
    render :partial => 'shared/video', :locals => { :url => url }
  end 
end
