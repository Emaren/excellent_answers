class Question < ActiveRecord::Base

  validate :no_monkey

   after_initialize :set_default_values

   before_validation :capitalize_title

   # scope(:recent_ten, lambda { order("created_at DESC").limit(10) })
   def self.recent_ten
     order("created_at DESC").limit(10)
   end

   def self.recent(num_records)
     order("created_at DESC").limit(num_records)
   end

   def self.search(term)
     if term == ""
       "You must enter a search term"
     else
-      # where(["title ILIKE :search_term OR body ILIKE :search_term",
+      # where(["title ILIKE :search_term OR body ILIKE :search_term",
       #         {search_term: "%#{term}%"}])
       where(["title ILIKE ? OR body ILIKE ?", "%#{term}%", "%#{term}%"])
     end
   end

   private

   # this is a custom validation method
   def no_monkey
     if title.present? && title.downcase.include?("monkey")
       errors.add(:title, "No monkeys please!")
     end
   end

   def set_default_values
     self.view_count ||= 7
   end

   def capitalize_title
     self.title.capitalize!
   end



end
