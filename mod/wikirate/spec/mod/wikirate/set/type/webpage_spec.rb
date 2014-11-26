# -*- encoding : utf-8 -*-
require 'link_thumbnailer'

describe Card::Set::Type::Webpage do
  describe "while creating a Page" do
    before do
      login_as 'joe_user' 
    end
    it "should add title,description" do
      
      url = 'http://www.google.com/?q=wikirateissocoolandawesomeyouknow'
      Card::Env.params[:sourcebox] = 'true'
      sourcepage = Card.create! :type_id=>Card::WebpageID,:subcards=>{ '+Link' => {:content=> url} }
      preview = LinkThumbnailer.generate(url)

      Card.fetch("#{ sourcepage.name }+title").content.should == preview.title
      Card.fetch("#{ sourcepage.name }+description").content.should == preview.description
     
    end
    it "should handle empty url" do
        url = ''
        Card::Env.params[:sourcebox] = 'true'
        sourcepage = Card.new :type_id=>Card::WebpageID,:subcards=>{ '+Link' => {:content=> url} }
        sourcepage.should_not be_valid
        sourcepage.errors.should have_key :link
        sourcepage.errors[:source]=="is empty"
    end
    describe "while creating duplicated source on claim page" do
      it "should return exisiting url" do
        url = 'http://www.google.com/?q=wikirateissocoolandawesomeyouknow'
        Card::Env.params[:sourcebox] = 'true'
        firstsourcepage = Card.create :type_id=>Card::WebpageID,:subcards=>{ '+Link' => {:content=> url} }
        secondsourcepage = Card.create :type_id=>Card::WebpageID,:subcards=>{ '+Link' => {:content=> url} }
        firstsourcepage.name.should == secondsourcepage.name
      end
    end
    describe "while creating duplicated source on source page" do
      it "should show error" do
        url = 'http://www.google.com/?q=wikirateissocoolandawesomeyouknow'
        
        firstsourcepage = Card.create :type_id=>Card::WebpageID,:subcards=>{ '+Link' => {:content=> url} }
        secondsourcepage = Card.new :type_id=>Card::WebpageID,:subcards=>{ '+Link' => {:content=> url} }

        secondsourcepage.should_not be_valid
        secondsourcepage.errors.should have_key :link
        expect(secondsourcepage.errors[:link]).to include("exists already. <a href='/#{firstsourcepage.name}'>Visit the source.</a>")

       
      end
    end
  end
  describe "while rendering views" do 
    before do 
      login_as 'joe_user'
      url = 'http://www.google.com/?q=wikirateissocoolandawesomeyouknow'
      @source_page = create_page url,{}
    end
    # it "renders edit view following its structure rule" do 
    
    # end

    it "renders titled view with voting" do
      expect(@source_page.format.render_titled).to eq(@source_page.format.render_titled_with_voting)
    end

    it "renders open view with :custom_source_header to be true" do 
      expect(@source_page.format.render_open).to include(@source_page.format.render_header_with_voting)
    end

    it "renders header view with :custom_source_header to be true" do
      expect(@source_page.format.render_header  :custom_source_header=>true ).to include(@source_page.format.render_header_with_voting)
    end

  end
end
