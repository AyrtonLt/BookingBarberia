const express = require('express');
const router = express.Router();
const userController = require('../controllers/barberoControllers');

router.get("/barberos", userController.getUsers);
router.post("/barberos/:id", userController.createUser);
router.put("/barberos/:id", userController.updateUser);
router.delete("/barberos/:id", userController.deleteUser);

module.exports = router;