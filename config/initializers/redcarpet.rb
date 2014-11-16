MARKDOWN = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(hard_wrap: true), 
  autolink: true, tables: true, no_intra_emphasis: true, fenced_code_blocks: true
)
