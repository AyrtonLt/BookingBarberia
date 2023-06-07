import React from "react";
import "./App.css";

import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";

import history from "./services/history";
import Routes from "./routes";
import GlobalStyles from "./styles/global";

import {
  createMuiTheme,
  makeStyles,
  ThemeProvider,
} from "@material-ui/core/styles";

const newTheme = createMuiTheme({
  palette: {
    primary: {
      main: "#29354C", // Color principal 1
      dark: "#303E58", // Color principal 2 (más oscuro)
      light: "#374765", // Color principal 3 (más claro)
      contrastText: "#FFFFFF", // Texto contrastante para los colores principales
    },
    secondary: {
      main: "#682328", // Color de acentuación 1
      dark: "#7A292E", // Color de acentuación 2 (más oscuro)
      light: "#8B2F35", // Color de acentuación 3 (más claro)
      contrastText: "#FFFFFF", // Texto contrastante para los colores de acentuación
    },
    tertiary: {
      main: "#A93941", // Color de acentuación 4
      dark: "#C24951", // Color de acentuación 5 (más oscuro)
      light: "#475B82", // Color principal 4 (más claro)
      contrastText: "#FFFFFF", // Texto contrastante para los colores de acentuación
    },
  },
});

function App() {
  return (
    <Router history={history}>
      <ThemeProvider theme={newTheme}>
        <Routes />
      </ThemeProvider>
      <GlobalStyles />
    </Router>
  );
}
export default App;
