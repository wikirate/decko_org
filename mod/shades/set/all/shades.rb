format :html do
  view :shade do 
    wrap do
      %{
        <h1>
          <a href="#" class="ui-icon ui-icon-triangle-1-e"></a>
          <a class="shade-link">#{render_title}</a>
        </h1>
        <div class="shade-content">#{render_core}</div>
      }
    end
  end
end

