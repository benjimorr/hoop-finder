import React, { Component } from 'react';
import { Field, reduxForm } from 'redux-form';
import { connect } from 'react-redux';
import { fetchRssFeed } from '../actions/index';

class RssFeedForm extends Component {
  renderField(field) {
    const { meta: { touched, error } } = field;
    const className = `form-group ${touched && error ? 'has-warning' : ''}`

    return (
      <div className={className}>
        <input
          type={field.type}
          placeholder={field.placeholder}
          className="form-control"
          {...field.input}
        />
        <div className="help-block">
          {touched ? error : ''}
        </div>
      </div>
    );
  }

  onSubmit(feed) {
    this.props.fetchRssFeed(feed);
  }

  render() {
    const { handleSubmit } = this.props;

    return (
      <div className="">
        <form onSubmit={handleSubmit(this.onSubmit.bind(this))}>
          <Field
            name="feedName"
            type=""
            placeholder=""
            component={this.renderField}
          />
          <button type="submit" className="btn btn-secondary">Go</button>
        </form>
      </div>
    );
  }
}

function validate(values) {
    const errors = {};

    if(!values.feedName) {
        errors.feedName = "Please enter a valid news feed.";
    }

    return errors;
}

export default reduxForm({
    validate,
    form: 'RssFeedForm'
})(
    connect(null, { fetchRssFeed })(RssFeedForm)
);
