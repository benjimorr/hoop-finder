import React, { Component } from 'react';
import { connect } from "react-redux";
import { bindActionCreators } from "redux";

class ArticleList extends Component {
  constructor(props) {
    super(props);

    this.renderStory = this.renderStory.bind(this);
  }

  renderStory(story) {
    return (
      <div>
        {story}
      </div>
    );
  }

  render() {
    if(this.props.feedResults.length > 0) {
      return (
        <div className="">
          <ul className="list-group">
            {this.props.feedResults.map(result => this.renderStory(result))}
          </ul>
        </div>
      );
    } else {
      return (
        <div className="">
          <h2 className="">Please select a news feed to view basketball news.</h2>
        </div>
      );
    }
  }
}

function mapStateToProps({ feedResults }) {
    return { feedResults };
}

// function mapDispatchToProps(dispatch) {
//     return bindActionCreators({  }, dispatch);
// }

export default connect(mapStateToProps)(ArticleList);
