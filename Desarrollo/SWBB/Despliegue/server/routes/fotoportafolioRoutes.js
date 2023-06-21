const express = require('express');
const router = express.Router();
const fotoportafolioController = require('../controllers/fotoportafolioControllers');

router.get("", fotoportafolioController.getFotoPortafolio);
router.post("", fotoportafolioController.createFotoPortafolio);
router.put("/:id", fotoportafolioController.updateFotoPortafolio);
router.delete("/:id", fotoportafolioController.deleteFotoPortafolio);
router.get("/:id", fotoportafolioController.getFotoPortafolioByBarbero);

module.exports = router;
