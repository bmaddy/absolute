module Features
  module CreateWorks
    def classify_what_you_are_uploading(concern)
      expect(page).to have_content("What are you uploading?")
      find("a.btn.add_new_#{concern.gsub(/\s/,'_').downcase}").click
    end
  end
end
