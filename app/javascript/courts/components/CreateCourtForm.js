import React, { Component } from 'react';
import { Field, reduxForm } from 'redux-form';
import { connect } from 'react-redux';
import { createCourt } from '../actions/index';

class CreateCourtForm extends Component {
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

    onSubmit(values) {
        this.props.createCourt(values);
    }

    render() {
        const { handleSubmit } = this.props;

        return (
            <div className="new-court-form">
                <form onSubmit={handleSubmit(this.onSubmit.bind(this))}>
                    <Field
                        name="streetAddress"
                        type="text"
                        placeholder="Street Address"
                        component={this.renderField}
                    />
                    <Field
                        name="city"
                        type="text"
                        placeholder="City"
                        component={this.renderField}
                    />
                    <Field
                        name="state"
                        type="text"
                        placeholder="State"
                        component={this.renderField}
                    />
                    <button type="submit" className="btn btn-secondary">Submit</button>
                </form>
            </div>
        );
    }
}

function validate(values) {
    const errors = {};

    if(!values.streetAddress) {
        errors.streetAddress = "Please enter a valid street address (i.e. 170 Maple Oak Drive).";
    }
    if(!values.city) {
        errors.city = "Please enter a valid city.";
    }
    if(!values.state || values.state.length > 2) {
        errors.state = "Please enter a valid state (i.e. MA).";
    }

    return errors;
}

export default reduxForm({
    validate,
    form: 'CreateCourtForm'
})(
    connect(null, { createCourt })(CreateCourtForm)
);
