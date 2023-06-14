import React from "react";
import { Typography, Link } from "@material-ui/core";

const Copyright = () => {
    return (
        <Typography variant="body2" color="textSecondary" align="center">
            {"Copyright © "}
            {new Date().getFullYear()}
            {" "}
            <Link color="inherit" href="https://github.com/AyrtonLt/BugFund">
                BugFund. Todos los derechos reservados.
            </Link>
        </Typography>
    );
};

export default Copyright;
