const express = require('express');
const router = express.Router();
const userController = require('../controllers/clienteControllers');

router.get("", userController.getUsers);
router.post("", userController.createUser);
router.put("/:id", userController.updateUser);
router.delete("/:id", userController.deleteUser);
// Ruta para el inicio de sesión
router.post("/login", userController.login);

module.exports = router;