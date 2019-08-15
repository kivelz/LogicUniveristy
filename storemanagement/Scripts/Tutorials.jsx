var CommentBox = React.createClass({
    render: function () {
        return (
            <div className="commentBox">
                <h1> Hello, world! This is viral jain.</h1>
            </div>
        );
    }
});
ReactDOM.render(
    <CommentBox />,
    document.getElementById('content')
);