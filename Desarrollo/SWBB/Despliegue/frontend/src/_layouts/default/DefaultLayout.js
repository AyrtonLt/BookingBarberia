import React, { useEffect } from "react";
import { useRouteMatch, useHistory, Link } from "react-router-dom";
import { Storage } from "../../Utils/Storage";
import { makeStyles } from "@material-ui/core/styles";
import {
  AppBar,
  Toolbar,
  Typography,
  Switch,
  FormControlLabel,
  FormGroup,
  MenuItem,
  Menu,
  Button,
  Paper,
  useMediaQuery,
  IconButton,
} from "@material-ui/core";
import clsx from "clsx";
import Settings from "@material-ui/icons/Settings";
import AccountCircle from "@material-ui/icons/AccountCircle";
import StoreIcon from "@material-ui/icons/Store";
import styled from "styled-components";
import BarberoLogo from "../../Resources/Images/barbero.png";
import MenuIcon from "@material-ui/icons/Menu";
import { useTheme } from "@material-ui/core/styles";

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    background: "#f5f5f5",
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
  },
}));

const Footer = () => {
  return (
    <Paper
      style={{
        height: "150px",
        display: "flex",
        flexDirection: "row",
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      FOOOTER
    </Paper>
  );
};

const DrawerMenu = styled.div`
  background: white;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  position: absolute;
  bottom: -48px;
  left: 0;
  transition: transform 0.3s ease-in-out;
  // height: ${({open}) => (open ? "auto" : "0px")};
  opacity: ${({ open }) => (open ? "0.8" : "0")};
  transform: ${({ open }) => (open ? "translateY(0)" : "translateY(50)")};
`;

const DefaultLayout = (props) => {
  const classes = useStyles();
  const [anchorEl, setAnchorEl] = React.useState(null);
  const [drawer, setDrawer] = React.useState(null);
  const open = Boolean(anchorEl);
  const customer = Storage.GetItem("customer");

  const history = useHistory();
  const { path } = useRouteMatch();
  const theme = useTheme();
  const fullScreen = useMediaQuery(theme.breakpoints.down("sm"));

  const handleDrawerMenu = (event) => {
    setDrawer(event.currentTarget);
  };

  const handleDrawerClose = () => {
    setDrawer(null);
  };

  const handleMenu = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const handleLogout = () => {
    // Eliminar el token del almacenamiento local
    localStorage.removeItem("token");
    // Redirigir al usuario a la página de inicio de sesión u otra página relevante
    history.push("/");
  };

  // Verificar si el usuario está autenticado según la existencia del token en el almacenamiento local
  const isAuthenticated = !!localStorage.getItem("token");
  console.log("¿El usuario está autenticado?", isAuthenticated);

  return (
    <>
      <div
        className={classes.root}
        style={{ height: "100%", width: "100%" }}
      >
        <AppBar
          position="static"
          style={{ width: "100%", position: "relative" }}
          color="white"
          elevation={1}
        >
          <Toolbar>
            <Link to="/" style={{ color: "black" }}>
              <img
                src={BarberoLogo}
                style={{
                  width: "50px",
                  height: "50px",
                  marginRight: "1em",
                }}
              ></img>
            </Link>

            {fullScreen ? (
              <div
                style={{
                  display: "flex",
                  flexDirection: "row",
                  justifyContent: "space-between",
                  alignItems: "center",
                  width: "100%",
                }}
              >
                <Typography variant="h6" className={classes.title}>
                  <Button>
                    <Link
                      to="/barbers"
                      style={{ marginLeft: "1em", color: "black" }}
                    >
                      Barberías
                    </Link>
                  </Button>
                </Typography>
                {customer ? (
                  <>
                    <IconButton
                      aria-label="account of current user"
                      aria-controls="menu-appbar"
                      aria-haspopup="true"
                      onClick={handleMenu}
                      color="inherit"
                    >
                      <AccountCircle />
                    </IconButton>
                    <Menu
                      id="menu-appbar"
                      anchorEl={anchorEl}
                      anchorOrigin={{
                        vertical: "top",
                        horizontal: "right",
                      }}
                      keepMounted
                      transformOrigin={{
                        vertical: "top",
                        horizontal: "right",
                      }}
                      open={open}
                      onClose={handleClose}
                    >
                      <MenuItem
                        onClick={() => {
                          history.push("/profile");
                          handleClose();
                        }}
                      >
                        Perfil
                      </MenuItem>
                      <MenuItem onClick={handleLogout}>Cerrar Sesión</MenuItem>
                    </Menu>
                  </>
                ) : (
                  <IconButton
                    aria-label="menu"
                    aria-controls="menu-appbar"
                    aria-haspopup="true"
                    onClick={handleDrawerMenu}
                    color="inherit"
                  >
                    <MenuIcon />
                  </IconButton>
                )}
                <Menu
                  id="menu-appbar"
                  anchorEl={drawer}
                  anchorOrigin={{
                    vertical: "top",
                    horizontal: "right",
                  }}
                  keepMounted
                  transformOrigin={{
                    vertical: "top",
                    horizontal: "right",
                  }}
                  open={drawer}
                  onClose={handleDrawerClose}
                >
                  <MenuItem
                    onClick={() => {
                      if (customer) history.push("/profile");
                      else history.push("/login");
                      handleDrawerClose();
                    }}
                  >
                    {customer ? `${customer.name} ${customer.lastName}` : "Iniciar Sesión"}
                  </MenuItem>
                  <MenuItem
                    onClick={() => {
                      handleDrawerClose();
                      if (customer) {
                        Storage.RemoveItem("customer");
                        history.push("/login");
                        props.setCustomer(false);
                      } else {
                        history.push("/signup");
                        props.setCustomer(false);
                      }
                    }}
                  >
                    {customer ? "Cerrar Sesión" : "Regístrate"}
                  </MenuItem>
                </Menu>
              </div>
            ) : (
              <>
                <Typography variant="h6" className={classes.title}>
                  <Button
                    style={{ marginLeft: "1em" }}
                    component={Link}
                    to="/"
                    color="black"
                  >
                    Home
                  </Button>
                  <Button component={Link} to="/barbers" color="black">
                    Barberías
                  </Button>
                  <Button component={Link} to="/profile" color="black">
                    Perfil
                  </Button>

                </Typography>
                <div>
                  {customer ? (
                    <div
                      style={{
                        display: "flex",
                        flexDirection: "row",
                        justifyContent: "center",
                        alignItems: "center",
                      }}
                    >
                      <div style={{ color: "black" }}>
                        {customer.name} {customer.lastName}
                      </div>
                      <IconButton
                        aria-label="account of current user"
                        aria-controls="menu-appbar"
                        aria-haspopup="true"
                        onClick={handleMenu}
                        color="inherit"
                      >
                        <AccountCircle />
                      </IconButton>
                      <Menu
                        id="menu-appbar"
                        anchorEl={anchorEl}
                        anchorOrigin={{
                          vertical: "top",
                          horizontal: "right",
                        }}
                        keepMounted
                        transformOrigin={{
                          vertical: "top",
                          horizontal: "right",
                        }}
                        open={open}
                        onClose={handleClose}
                      >
                        {isAuthenticated &&(
                          <MenuItem
                            onClick={() => {
                              history.push("/profile");
                              handleClose();
                            }}
                          >
                            Perfil
                          </MenuItem>
                        )}
                        <MenuItem onClick={handleLogout}>Cerrar Sesión</MenuItem>
                      </Menu>
                    </div>
                  ) : (
                    <>
                      {!isAuthenticated && (
                        <>
                          <Button
                            variant="outlined"
                            style={{ marginRight: ".5em", padding: ".5em 1em" }}
                            component={Link}
                            to="/signup"
                            color="black"
                          >
                            Regístrate
                          </Button>
                          <Button
                            variant="contained"
                            color="primary"
                            style={{ padding: ".5em 1em" }}
                            className={classes.button}
                            component={Link}
                            to="/login"
                          >
                            Iniciar Sesión
                          </Button>
                        </>
                      )}
                      {isAuthenticated && (
                        <Button
                          variant="contained"
                          color="primary"
                          style={{ padding: ".5em 1em" }}
                          className={classes.button}
                          component={Link}
                          to="/"
                          onClick={handleLogout}
                        >
                          Cerrar Sesión
                        </Button>
                      )}
                    </>
                  )}
                </div>
              </>
            )}
          </Toolbar>
        </AppBar>
        <div
          style={{
            width: "100%",
            height: "calc(100vh - 65px)",
            overflow: "auto",
            alignItems: "flex-start",
          }}
        >
          {props.children}
        </div>
        {/* {path.includes("login") || path.includes("signup") ? null : <Footer />} */}
      </div>
    </>
  );
};

export default DefaultLayout;
