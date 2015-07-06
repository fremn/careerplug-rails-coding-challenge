var CommentForm = React.createClass({
  propTypes: {
    jobId: React.PropTypes.number,
    submitComment: React.PropTypes.func
  },
  submitComment: function (e) {
    e.preventDefault();
    var formField = React.findDOMNode(this.refs.comment);
    var message = formField.value.trim();
    this.props.submitComment({message: message, jobId: this.props.jobId});
    formField.value = '';
  },
  render: function() {
    return (
        <form className="commentForm input-group" onSubmit={this.submitComment}>
          <input className="form-control" ref="comment" type="text" placeholder="Write A Comment" />
          <span className="input-group-btn">
            <button className="btn btn-default" type="submit">Comment!</button>
          </span>
        </form>
    );
  }
});
