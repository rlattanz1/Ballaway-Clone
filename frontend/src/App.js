import React from 'react';
import { Route, Switch } from 'react-router-dom';
import ProductIndexPage from './components/ProductIndex';
import ProductShowPage from './components/ProductShow'
import SignupFormPage from './components/SignupFormPage';
import Navigation from "./components/Navigation";
import HomeComponent from './components/Home';


function App() {
  return (
    <>
      <Navigation />
        <Switch>
          <Route exact path="/products/:productId">
            <ProductShowPage />
          </Route>
          <Route exact path="/signup">
            <SignupFormPage />
          </Route>
          <Route path="/products">
            <ProductIndexPage />
          </Route>
        </Switch>
      <HomeComponent />
    </>
  );
}

export default App;
