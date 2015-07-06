var CommentList = React.createClass({
  propTypes: {
    collection: React.PropTypes.array
  },
  componentDidUpdate: function() {
    'use strict';
    var node = this.getDOMNode();
    node.scrollTop = node.scrollHeight;
  },
  render: function () {
    var commentNodes = this.props.collection.map(function (comment) {
      return (
          <Comment message={comment.message}></Comment>
      );
    });
    return (
        <div className="commentList">
          {commentNodes}
        </div>
    );
  }
});
