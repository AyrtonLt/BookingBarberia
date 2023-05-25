const express = require('express');
const router = express.Router();
const serviceController = require('../controllers/servicioControllers');

router.get("/servicios", serviceController.getServices);
router.post("/servicios/:id", serviceController.createService);
router.put("/servicios/:id", serviceController.updateService);
router.delete("/servicios/:id", serviceController.deleteService);

module.exports = router;