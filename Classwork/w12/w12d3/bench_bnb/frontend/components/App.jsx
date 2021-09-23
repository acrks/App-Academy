const App = () => (
    <div>
      <header>
        <h1>Bench BnB</h1>
        <GreetingContainer />
      </header>
  
      <AuthRoute exact path="/login" component={SessionFormContainer} />
      <AuthRoute exact path="/signup" component={SessionFormContainer} />
      <Route exact path="/" component={BenchIndexContainer} />
    </div>
  );