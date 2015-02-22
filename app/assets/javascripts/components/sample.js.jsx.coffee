@converter = new Showdown.converter()

@Comment = React.createClass
  render: ->
    rawMarkup = converter.makeHtml @props.children.toString()
    console.log rawMarkup
    `<div className="comment">
      <h2 className="commentAuthor">{this.props.author}</h2>
      <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
    </div>`

@CommentList = React.createClass
  render: ->
    `<div className="CommentList">
      <Comment author="author1">comment1</Comment>
      <Comment author="author2">comment2</Comment>
    </div>`

@CommentForm = React.createClass
  render: ->
    `<div className="CommentForm">CommentForm.</div>`

@CommentBox = React.createClass
  render: ->
    `<div className="CommentBox">
      <h1>Comments</h1>
      <CommentList />
      <CommentForm />
    </div>`
