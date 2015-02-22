@converter = new Showdown.converter()

@Comment = React.createClass
  render: ->
    rawMarkup = converter.makeHtml @props.children.toString()
    `<div className="comment">
      <h2 className="commentAuthor">{this.props.author}</h2>
      <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
    </div>`

@CommentList = React.createClass
  render: ->
    commentNodes = @props.data.map (comment) -> `<Comment author={comment.author}>{comment.text}</Comment>`
    `<div className="CommentList">{commentNodes}</div>`

@CommentForm = React.createClass
  render: ->
    `<div className="CommentForm">CommentForm.</div>`

@CommentBox = React.createClass
  render: ->
    `<div className="CommentBox">
      <h1>Comments</h1>
      <CommentList data={this.props.data} />
      <CommentForm />
    </div>`
