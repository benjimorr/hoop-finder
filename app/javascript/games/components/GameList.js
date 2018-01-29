import React, { Component } from 'react';
import moment from 'moment';

export default class GameList extends Component {
    constructor(props) {
        super(props)
        this.state = {
            games: this.props.games
        }
    }

    renderGames(game) {
        let id = game.id;
        let title = game.title;
        let date = moment.utc(game.date).format("MM/DD/YYYY h:mm:ss A");
        let courtName = game.court_name;
        let playerCount = game.user_count;

        return (
            <li key={id} className="list-group-item list-group-item-action">
                <div className="row">
                    <div className="col-sm-6">
                        <h2>{title}</h2>
                        <p>{date} at {courtName}</p>
                    </div>
                    <div className="col-sm-6 game-detail-right">
                        <h5>Players: {playerCount}/10</h5>
                        <button className="btn btn-success game-detail-btn">RSVP</button>
                        <button className="btn btn-primary game-detail-btn">More Info</button>
                    </div>
                </div>
            </li>
        );
    }

    render() {
        return (
            <ul className="list-group">
                { this.state.games.map(game => this.renderGames(game)) }
            </ul>
        );
    }
}
