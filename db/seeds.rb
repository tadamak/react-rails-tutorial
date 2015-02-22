[
  { author: 'Author1', text: 'Text1' },
  { author: 'Author2', text: 'Text2' }
].each { |comment| Comment.create(comment) }
