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
    commentNodes = @props.data.map (comment, index) -> `<Comment author={comment.author} key={index}>{comment.text}</Comment>`
    `<div className="CommentList">{commentNodes}</div>`

@CommentForm = React.createClass
  handleSubmit: (e) ->
    e.preventDefault()
    author = @refs.author.getDOMNode().value.trim()
    text = @refs.text.getDOMNode().value.trim()
    return unless text && author
    @props.onCommentSubmit author: author, text: text
    @refs.author.getDOMNode().value = ''
    @refs.text.getDOMNode().value = ''
  render: ->
    `<form className="commentForm" onSubmit={this.handleSubmit}>
      <input type="text" placeholder="Name" ref="author" />
      <input type="text" placeholder="Comment" ref="text" />
      <input type="submit" value="Post" />
    </form>`

@CommentBox = React.createClass
  getInitialState: -> data: []
  loadCommentsFromServer: ->
    $.ajax
      url: @props.url
      dataType: 'json'
    .done (data) =>
      @setState data: data
    .fail (xhr, status, err) =>
      console.error @props.url, status, err.toString()
  componentDidMount: ->
    @loadCommentsFromServer()
    setInterval @loadCommentsFromServer, @props.pollInterval
  handleCommentSubmit: (comment) ->
    @setState data: @state.data.concat [comment]
    $.ajax
      url: @props.url
      dataType: 'json'
      type: 'POST'
      data: comment: comment
    .done (data) =>
      @setState data: data
    .fail (xhr, status, err) =>
      console.error @props.url, status, err.toString()
  render: ->
    `<div className="CommentBox">
      <h1>Comments</h1>
      <CommentList data={this.state.data} />
      <CommentForm onCommentSubmit={this.handleCommentSubmit} />
    </div>`
