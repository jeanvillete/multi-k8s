import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <p>
              Fib Calculator version KUBERNETES
            </p>
            <p>
              <Link to="/" style={{ marginRight : '15px' }}>Home</Link>
              <Link to="/otherpage">Other Page</Link>
            </p>
          </header>
          <div>
            <Route exact path="/" component={ Fib } />
            <Route path="/otherpage" component={ OtherPage } />
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
