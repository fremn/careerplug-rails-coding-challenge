var Comment = React.createClass({
  propTypes: {
    message: React.PropTypes.string
  },

  render: function() {
    return (
      <div className='comment'>
        <p>{this.props.message}</p>
      </div>
    );
  }
});
