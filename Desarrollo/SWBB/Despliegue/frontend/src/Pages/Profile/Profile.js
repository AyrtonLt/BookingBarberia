import React, { useState, useEffect } from "react";
import {
  Grid,
  Card,
  CardContent,
  Typography,
  TextField,
  Button,
} from "@material-ui/core";

const Profile = () => {
  const [name, setName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");
  const [editMode, setEditMode] = useState(false);

  const handleEdit = () => {
    setEditMode(true);
  };

  const handleSave = () => {
    // Perform save operation here
    setEditMode(false);
  };

  const handleViewAppointments = () => {
    // Logic to navigate to appointments page
  };

  useEffect(() => {
    const fetchUserProfile = async () => {
      try {
        const response = await fetch("API_URL"); // Reemplaza "API_URL" con la URL de tu API
        const data = await response.json();
        setName(data.name);
        setLastName(data.lastName);
        setEmail(data.email);
        setPhone(data.phone);
      } catch (error) {
        console.log("Error fetching user profile:", error);
      }
    };

    fetchUserProfile();
  }, []);

  return (
    <Grid container justify="center">
      <Grid item xs={12} sm={8} md={6}>
        <Card>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              Profile
            </Typography>
            <TextField
              label="Name"
              fullWidth
              value={name}
              onChange={(e) => setName(e.target.value)}
              disabled={!editMode}
              margin="normal"
            />
            <TextField
              label="Last Name"
              fullWidth
              value={lastName}
              onChange={(e) => setLastName(e.target.value)}
              disabled={!editMode}
              margin="normal"
            />
            <TextField
              label="Email"
              fullWidth
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              disabled={!editMode}
              margin="normal"
            />
            <TextField
              label="Phone"
              fullWidth
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              disabled={!editMode}
              margin="normal"
            />
          </CardContent>
          <div style={{ display: "flex", justifyContent: "space-between", padding: "16px" }}>
            {!editMode && (
              <Button variant="outlined" onClick={handleEdit}>
                Editar Perfil
              </Button>
            )}
            {editMode && (
              <Button variant="outlined" color="primary" onClick={handleSave}>
                Guardar
              </Button>
            )}
            <Button variant="outlined" onClick={handleViewAppointments}>
              Ver mis citas
            </Button>
          </div>
        </Card>
      </Grid>
    </Grid>
  );
};

export default Profile;
