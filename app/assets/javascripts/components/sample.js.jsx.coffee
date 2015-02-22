@CommentList = React.createClass
  render: ->
    `<div className="CommentList">CommentList.</div>`

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
