import React, { useEffect, useState } from "react";
import { useHistory, Redirect } from "react-router-dom";
import { Agent, Storage, Loading } from "../../Utils/importFiles";
import {
  Avatar,
  Button,
  TextField,
  FormControlLabel,
  Checkbox,
  Link,
  Grid,
  Box,
  Typography,
  Container,
} from "@material-ui/core";
import LockOutlinedIcon from "@material-ui/icons/LockOutlined";
import ConfirmModal from "../../Components/ConfirmModal/ConfirmModal";
import { makeStyles } from "@material-ui/core/styles";

function Copyright() {
  return (
    <Typography variant="body2" color="textSecondary" align="center">
      {"Copyright © "}
      {new Date().getFullYear()}
      {" "}
      <Link color="inherit" href="https://material-ui.com/">
        BugFund. Todos los derechos reservados.
      </Link>
    </Typography>
  );
}

const useStyles = makeStyles((theme) => ({
  paper: {
    marginTop: theme.spacing(8),
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
  },
  avatar: {
    margin: theme.spacing(1),
    backgroundColor: theme.palette.secondary.main,
  },
  form: {
    width: "100%", // Fix IE 11 issue.
    marginTop: theme.spacing(1),
  },
  submit: {
    margin: theme.spacing(3, 0, 2),
  },
}));

const Login = (props) => {
  const classes = useStyles();
  const [eMail, seteMail] = useState("");
  const [password, setPassword] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [openConfirmModal, setOpenConfirmModal] = useState(false);
  const [modalContent, setModalContent] = useState("");
  const history = useHistory();

  const customer = props.customer;
  return !customer ? (
    <Container component="main" maxWidth="xs">
      {isLoading && <Loading></Loading>}
      {/* <CssBaseline /> */}
      <ConfirmModal
        openConfirmModal={openConfirmModal}
        setOpenConfirmModal={setOpenConfirmModal}
        confirmMesage={"Confirmar"}
        modalContent={modalContent}
      />
      <div className={classes.paper}>
        <Avatar className={classes.avatar}>
          <LockOutlinedIcon />
        </Avatar>
        <Typography component="h1" variant="h5">
          Iniciar Sesión
        </Typography>
        <form className={classes.form} noValidate>
          <TextField
            variant="outlined"
            value={eMail}
            onChange={(e) => {
              seteMail(e.target.value);
            }}
            margin="normal"
            required
            fullWidth
            id="email"
            label="Correo Electrónico"
            name="email"
            autoComplete="email"
            autoFocus
          />
          <TextField
            variant="outlined"
            value={password}
            onChange={(e) => {
              setPassword(e.target.value);
            }}
            margin="normal"
            required
            fullWidth
            name="password"
            label="Contraseña"
            type="password"
            id="password"
            autoComplete="current-password"
          />
          <FormControlLabel
            control={<Checkbox value="remember" color="primary" />}
            label="Recuérdame"
          />
          <Button
            // type="submit"
            fullWidth
            variant="contained"
            color="primary"
            className={classes.submit}
            onClick={() => {
              if (password && eMail) {
                setIsLoading(true);
                Agent.Customers.login()
                  .send({
                    eMail: eMail,
                    password: password,
                  })
                  .then((res) => {
                    if (res.ok) {
                      if (!res.body.Error) {
                        setIsLoading(false);
                        Storage.SetItem("customer", {
                          ...res.body.data,
                          password: "****",
                        });
                        history.push("/");

                        props.setCustomer({
                          ...res.body.data,
                          password: "****",
                        });
                      } else {
                        setOpenConfirmModal(true);
                        setIsLoading(false);
                        setModalContent(res.body.Message);
                      }
                    }
                  });
              }
            }}
          >
            Iniciar Sesión
          </Button>
          <Grid container>
            <Grid item xs>
              <Link href="#" variant="body2">
                ¿Olvidaste tu contraseña?
              </Link>
            </Grid>
            <Grid item>
              <Link href="/signup" variant="body2">
                {"¿Aún no tienes una cuenta? Regístrate aquí"}
              </Link>
            </Grid>
          </Grid>
        </form>
      </div>
      <Box mt={5}>
        <Copyright />
      </Box>
    </Container>
  ) : (
    <Redirect to="/" />
  );
};
export default Login;
