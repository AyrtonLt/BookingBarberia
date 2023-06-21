const express = require('express');
const router = express.Router();
const barberiaController = require('../controllers/barberiaControllers');

router.get("", barberiaController.getBarberias);
router.post("", barberiaController.createBarberia);
router.put("/:id", barberiaController.updateBarberia);
router.delete("/:id", barberiaController.deleteBarberia);

module.exports = router;
