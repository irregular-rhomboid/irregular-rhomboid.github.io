Jekyll::Hooks.register [:pages, :documents], :pre_render do |doc|
  next unless doc.extname =~ /\.(md|markdown)$/

  #Jekyll.logger.info "Pandoc:", "Processing #{doc.path}"

  doc.content = IO.popen(
    ['pandoc', '-f', 'markdown+pipe_tables', '-t', 'html', '--mathml'],
    'r+',
    err: '/dev/null'
  ) do |io|
    io.write(doc.content)
    io.close_write
    io.read
  end

  doc.content = doc.content.gsub('<mo>\</mo>', '<mo>&#x2216;</mo>')
end