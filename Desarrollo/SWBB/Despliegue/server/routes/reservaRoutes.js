const express = require('express');
const router = express.Router();
const reservaController = require('../controllers/reservaControllers');

router.get('/', reservaController.getReservations);
router.post('/', reservaController.createReservation);
router.put('/:id', reservaController.updateReservation);
router.delete('/:id', reservaController.deleteReservation);

module.exports = router;
