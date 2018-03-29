import React, { Component } from 'react';
import { Field, reduxForm } from 'redux-form';
import { connect } from 'react-redux';
import { fetchRssFeed } from '../actions/index';

class RssFeedForm extends Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};

    this.handleChange = this.handleChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  onSubmit(event) {
    if(this.state.value === '') {
      alert('Please select a valid news feed.');
    } else {
      this.props.fetchRssFeed(this.state.value);
    }
  }

  render() {
    const { handleSubmit } = this.props;

    return (
      <div className="rss-feed-form">
        <form onSubmit={handleSubmit(this.onSubmit)}>
          <label>
            Choose a feed to view news:
            <select name="feedName" value={this.state.value} onChange={this.handleChange} className="form-control">
              <option value="">Choose feed...</option>
              <option value="http://www.espn.com/espn/rss/nba/news">NBA Basketball</option>
              <option value="http://www.espn.com/espn/rss/ncb/news">College Basketball</option>
            </select>
          </label>
          <button type="submit" className="btn btn-secondary">Go</button>
        </form>
      </div>
    );
  }
}

function validate(values) {
    const errors = {};

    if(values.feedName === '') {
        errors.feedName = "Please select a valid news feed.";
    }

    return errors;
}

export default reduxForm({
    validate,
    form: 'RssFeedForm'
})(
    connect(null, { fetchRssFeed })(RssFeedForm)
);
