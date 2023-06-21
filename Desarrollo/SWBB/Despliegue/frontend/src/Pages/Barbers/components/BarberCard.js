import React, { useState, useEffect } from "react";
import { makeStyles } from "@material-ui/core/styles";
import {
  Button,
  Typography,
  Grid,
  IconButton,
  Paper,
  ButtonBase,
} from "@material-ui/core";
import { LocationOnSharp } from "@material-ui/icons";
import { Link, useHistory } from "react-router-dom";

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    width: "100%",
    "&:hover": {
      cursor: "pointer",
      boxShadow: "15px",
    },
  },
  paper: {
    padding: theme.spacing(2),
    margin: "auto",
    width: "95%",
  },
  image: {
    width: 180,
    height: 180,
    marginRight: "1.5em",
  },
  img: {
    margin: "auto",
    display: "block",
    width: 250,
    height: 180,
    maxWidth: "100%",
    maxHeight: "100%",
  },
}));

export const BarberCard = ({ barber }) => {
  const classes = useStyles();
  const [shadow, setShadow] = useState(1);
  const history = useHistory();
  const [fotoPortafolio, setFotoPortafolio] = useState(null);

  useEffect(() => {
    // Obtener la foto del portafolio del backend
    fetch(`http://localhost:3000/fotoportafolio/${barber.id}`)
      .then((response) => response.json())
      .then((data) => {
        if (data && data[0] && data[0].contenidoFotoPortafolio) {
          const fotoPortafolioBlob = new Blob([data[0].contenidoFotoPortafolio], { type: "image/jpeg" });
          setFotoPortafolio(URL.createObjectURL(fotoPortafolioBlob));
        }
      })
      .catch((error) => console.error("Error al obtener la foto del portafolio", error));
  }, [barber.id]);

  const onMouseOver = () => {
    setShadow(3);
  };

  const onMouseOut = () => {
    setShadow(1);
  };

  return (
    <div className={classes.root}>
      <Link to={`/barberdetail/${barber.id}`}>
        <Paper
          className={classes.paper}
          onMouseOver={onMouseOver}
          onMouseOut={onMouseOut}
          elevation={shadow}
          onClick={() => {
            // history.push(`/barberdetail/${barber.id}`);
          }}
        >
          <Grid container spacing={2}>
            <Grid item>
              <ButtonBase className={classes.image}>
                {fotoPortafolio ? (
                  <img className={classes.img} alt="complex" src={fotoPortafolio} />
                ) : (
                  <span>Foto no disponible</span>
                )}
              </ButtonBase>
            </Grid>
            <Grid item xs={12} sm={11} sm container>
              <Grid item xs container direction="column" spacing={2}>
                <Grid item xs style={{}}>
                  <Typography
                    variant="h6"
                    gutterBottom
                    style={{ marginBottom: "1em" }}
                  >
                    {barber.nombreBarberia}
                  </Typography>
                  <Typography variant="body2" gutterBottom>
                    {barber.district_iDistrito}
                  </Typography>
                  <Typography
                    variant="body2"
                    color="textSecondary"
                    style={{
                      display: "flex",
                      flexDirection: "row",
                      alignItems: "center",
                      justifyContent: "flex-start",
                    }}
                  >
                    <LocationOnSharp color="gray " fontSize="small" />
                    {barber.direccionBarberia}
                  </Typography>
                </Grid>
                <Grid item style={{ textAlign: "right" }}>
                  <Button
                    size="small"
                    color="primary"
                    variant="contained"
                    onClick={() => {
                      //  Router.push("/barberdetail");
                    }}
                    style={{ marginRight: ".5em" }}
                  >
                    <Link
                      to={`/barberdetail/${barber.id}`}
                      style={{ color: "white" }}
                    >
                      Reservar una cita
                    </Link>
                  </Button>
                  <IconButton
                    aria-label="delete"
                    className={classes.margin}
                    size="small"
                  >
                    <LocationOnSharp />
                  </IconButton>
                </Grid>
              </Grid>
            </Grid>
          </Grid>
        </Paper>
      </Link>
    </div>
  );
};
