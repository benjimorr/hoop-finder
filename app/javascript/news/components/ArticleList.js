import React, { Component } from 'react';
import { connect } from "react-redux";
import { bindActionCreators } from "redux";

class ArticleList extends Component {
  constructor(props) {
    super(props);

    this.renderStory = this.renderStory.bind(this);
  }

  renderStory(story) {
    let title = story.children[0].innerHTML.replace("<![CDATA[", "").replace("]]>", "");
    let pubDate = story.children[3].innerHTML;
    let description = story.children[1].innerHTML.replace("<![CDATA[", "").replace("]]>", "");
    let link = story.children[2].innerHTML.replace("<![CDATA[", "").replace("]]>", "");

    return (
      <li key={story.id} className="list-group-item">
        <a href={link} target="_blank"><h4>{title}</h4></a>
        <p>{pubDate}</p>
        <p>{description}</p>
      </li>
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

export default connect(mapStateToProps)(ArticleList);
