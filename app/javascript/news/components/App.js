import React from 'react';
import RssFeedForm from './RssFeedForm';
import ArticleList from './ArticleList';

const App = () => (
    <div>
        <div className="row">
            <div className="col-sm-12">
                <RssFeedForm />
            </div>
        </div>
        <div className="row">
            <div className="col-sm-12">
                <ArticleList />
            </div>
        </div>
    </div>
)

export default App;
