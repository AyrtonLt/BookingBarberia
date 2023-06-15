import React, { useEffect, useState } from "react";
import axios from "axios";
import { Loading } from "../../Utils/importFiles";
import { makeStyles } from "@material-ui/core/styles";
import { SearchInput } from "./components/SearchInput";
import { BarberCard } from "./components/BarberCard";
import MapBoxComp from "./components/MapBoxComp";

import { Typography, Grid } from "@material-ui/core";

const Barbers = (props) => {
  const [barbers, setBarbers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [isEmpty, setIsEmpty] = useState(false);

  useEffect(() => {
    const fetchBarbers = async () => {
      try {
        const response = await axios.get("http://localhost:3000/barberias");
        const data = response.data;
        setBarbers(data);
        setLoading(false);
        setIsEmpty(data.length === 0);
      } catch (error) {
        console.log("Error:", error);
        setLoading(false);
      }
    };

    fetchBarbers();
  }, []);

  return (
    <Grid container direction="row" justify="center" alignItems="center">
      <SearchInput />
      {!loading ? (
        <Grid
          container
          direction="row"
          justify="flex-start"
          alignItems="flex-start"
        >
          {!isEmpty ? (
            <>
              <Grid item xs={12} sm={8} style={{ marginTop: "2em" }}>
                <Grid container spacing={4}>
                  {barbers.map((barber) => (
                    <Grid item xs={12} key={barber.idBarberia}>
                      <BarberCard barber={barber}></BarberCard>
                    </Grid>
                  ))}
                </Grid>
              </Grid>
              <Grid
                item
                xs={12}
                sm={4}
                style={{
                  marginTop: "2em",
                  display: "flex",
                  flexDirection: "row",
                  justifyContent: "center",
                  alignItems: "center",
                }}
              >
                <MapBoxComp />
              </Grid>
            </>
          ) : (
            <Loading emptyPage></Loading>
          )}
        </Grid>
      ) : (
        <Loading />
      )}
    </Grid>
  );
};

export default Barbers;
