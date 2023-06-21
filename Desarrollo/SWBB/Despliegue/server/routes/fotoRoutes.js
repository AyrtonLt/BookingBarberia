const express = require('express');
const router = express.Router();
const fotoController = require('../controllers/fotoControllers');

const upload = multer({ storage });

router.get("", );
router.post('upload', upload.single('img'), fotoController.createFoto);