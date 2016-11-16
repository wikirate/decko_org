include_set Abstract::MetricRecordFilter

def filter_keys
  %w(year metric_value)
end

def advanced_filter_keys
  %w(wikirate_company industry project)
end

format :html do
  def filter_labels field
    field.to_sym == :wikirate_company ? "Keyword" : super
  end

  def filter_body_header
    "Company"
  end

  def filter_title
    "Filter"
  end
end
