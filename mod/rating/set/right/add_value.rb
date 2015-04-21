def virtual?; true end

event :add_value, :before=>:approve, :on=>:update do
  binding.pry
  puts "hesllo"
  if (v_name = value_name)
    source_card = Card.create! :type_id=>Card::SourceID,:subcards=>subcards
    @subcards = {
      v_name => {
        :type_id=>Card::MetricValueID,
        :subcards=>{
          '+value'=>{:content=>Env.params[:value]},
          '+source'=>"[[#{source_card.name}]]"
        }}}
  end
end

def value_name
  if (metric_name = cardname.left) && Env.params[:year]
    "#{metric_name}+#{Env.params[:year]}"
  end
end


format :html do
  view :add_source do |args|
    with_inclusion_mode :edit do
      source = Card.new :type_code=>:source, :name=>'*dummy'
      source_form_content = subformat(source)._render_content_formgroups(args.merge(:hide=>'header help',:buttons=>""))
      #source_form_content = subformat(source)._render_edit(args.merge(:hide=>'header help',:buttons=>""))
    end
  end


  view :core do |args|
    years = Card.search :type=>'year'
    options = [["-- Select --",""]] + years.map{|x| [x.name,x.name]}
    year_tag = select_tag('year', options_for_select(options, years.first.name), :class=>'pointer-select form-control')
    value_tag = text_field_tag 'value', args[:pointer_item], :class=>'pointer-item-text form-control'
    card_form :update, :hidden=>{:content=>''} do
      wrap_each_with :div, :class=>'form-group' do
        [
          wrap_with(:div, "<label>Year</label>#{year_tag}".html_safe, :class=>'metric-value-year'),
          wrap_with(:div, "<label>Value</label>#{value_tag}".html_safe, :class=>'metric-value-value'),
        ]
      end.concat(_render_add_source(args))
    end
  end

  view :title do |args|
    "Add value to <strong>#{card.cardname.left}</strong>"
  end

  def default_modal_footer_args args
    args[:buttons] =  button_tag 'Add', :class=>'submit-button btn-primary submit-modal', :disable_with=>'Submitting', 'data-dismiss'=>'modal'
    args[:buttons] += button_tag 'Cancel', 'data-dismiss'=>'modal'
  end
end