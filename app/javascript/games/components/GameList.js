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
        let date = moment.utc(game.date).format("dddd, MM/DD/YYYY [at] h:mm A");
        let courtName = game.court_name;
        let playerCount = game.user_count;
        let button = game.in_game ?
            <button type="button" disabled className="btn btn-secondary">Attending</button> :
            <form method='post' action='/user_games' className='game-detail-form'>
                <input type="hidden" name="user_id" value={"" + game.user_id + ""} />
                <input type="hidden" name="game_id" value={"" + id + ""} />
                <input type="hidden" name="authenticity_token" value={"" + game.auth_token + ""} />
                <button type="submit" className="btn btn-success game-detail-btn">Join Game</button>
            </form>

        return (
            <li key={id} className="list-group-item list-group-item-action">
                <div className="row">
                    <div className="col-sm-6">
                        <h4>{title}</h4>
                        <h6>{date}  |  {courtName}</h6>
                    </div>
                    <div className="col-sm-6 game-detail-right">
                        <h6>Players: {playerCount}/10</h6>
                        {button}
                        <a href={"/games/" + id} className="btn btn-primary game-detail-btn">More Info</a>
                    </div>
                </div>
            </li>
        );
    }

    render() {
        if(this.state.games.length === 0) {
            return <h3 className="no-games">No Games Found</h3>;
        } else {
            return (
                <ul className="list-group">
                    { this.state.games.map(game => this.renderGames(game)) }
                </ul>
            );
        }
    }
}
