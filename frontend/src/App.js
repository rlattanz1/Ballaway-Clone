import React from 'react';
import { Route, Switch } from 'react-router-dom';
import ProductIndex from './components/Products/ProductIndex';
import ProductShowPage from './components/Products/ProductShow';
import SignupFormPage from './components/SignupFormPage';
import Navigation from './components/Navigation'
import CreateReviewPage from './components/Reviews/ReviewForm';
import HomeComponent from './components/Home';


function App() {
  return (
    <>
      <Navigation />
        <Switch>
          <Route exact path="/products/:productId/createreview">
            <CreateReviewPage />
          </Route>
          <Route exact path="/products/:productId">
            <ProductShowPage />
          </Route>
          <Route exact path="/signup">
            <SignupFormPage />
          </Route>
          <Route path="/products">
            <ProductIndex />
          </Route>
        </Switch>
      <HomeComponent />
    </>
  );
}

export default App;
