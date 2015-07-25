module ApplicationHelper
    
    # Makes the title
    def full_title(page_title = '')
       base = "PMD App - FBG Group" 
      if page_title.empty?
        base
      else
        page_title + " | " + base
      end
    end
    
end
