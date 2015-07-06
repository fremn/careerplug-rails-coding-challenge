
var CommentBox = React.createClass({
  propTypes: {
    collection: React.PropTypes.array,
    jobId: React.PropTypes.number
  },
  getInitialState: function () {
    "use strict";
    return {
      collection: this.props.collection
    };
  },
  submitComment: function(data) {
    "use strict";
    var path = '/jobs/' + data.jobId + '/comments';
    $.when($.post(path, {message: data.message})
    ).then(this.afterSubmit);
  },
  afterSubmit: function(data){
    "use strict";
    if (data.comment) {
      this.appendComment(data.comment);
    }
  },
  appendComment: function(comment) {
    "use strict";
    var previousComments = this.state.collection;
    previousComments.push(comment);
    this.setState({collection: previousComments});
  },

  render: function() {
    "use strict";
    return (
       <div>
        <h4>Comments</h4>
        <CommentList collection={this.state.collection}/>
        <CommentForm submitComment={this.submitComment}  jobId={this.props.jobId}/>
       </div>
    );
  }
});

