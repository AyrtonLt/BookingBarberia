import React from "react";
import { Link as RouterLink } from "react-router-dom";
import {
    Avatar,
    Button,
    Grid,
    Typography,
    Container,
} from "@material-ui/core";
import LockOutlinedIcon from "@material-ui/icons/LockOutlined";
import { makeStyles } from "@material-ui/core/styles";

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
    submit: {
        margin: theme.spacing(3, 0, 2),
    },
}));

const AccountCreated = () => {
    const classes = useStyles();

    return (
        <Container component="main" maxWidth="xs">
            <div className={classes.paper}>
                <Avatar className={classes.avatar}>
                    <LockOutlinedIcon />
                </Avatar>
                <Typography component="h1" variant="h5">
                    Registro Exitoso
                </Typography>
                <Typography component="p" variant="body1">
                    ¡Tu cuenta ha sido creada exitosamente!
                </Typography>
                <Typography component="p" variant="body2">
                    Ahora puedes iniciar sesión con tu nueva cuenta.
                </Typography>
                <Grid container justify="center">
                    <Grid item>
                        <Button
                            component={RouterLink}
                            to="/login"
                            variant="contained"
                            color="primary"
                            className={classes.submit}
                        >
                            Iniciar sesión
                        </Button>
                    </Grid>
                </Grid>
            </div>
        </Container>
    );
};

export default AccountCreated;
