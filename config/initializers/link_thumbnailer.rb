LinkThumbnailer.configure do |config|
  config.graders = [
    ->(description) { ::LinkThumbnailer::Graders::Length.new(description, ideal_description_length: 500) },
    ->(description) { ::LinkThumbnailer::Graders::HtmlAttribute.new(description, :class) },
    ->(description) { ::LinkThumbnailer::Graders::HtmlAttribute.new(description, :id) },
    ->(description) { ::LinkThumbnailer::Graders::Position.new(description) },
    ->(description) { ::LinkThumbnailer::Graders::LinkDensity.new(description) },
  ]
end
