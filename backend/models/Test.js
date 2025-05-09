const mongoose = require('mongoose');

const TestSchema = new mongoose.Schema({
  message: String,
});

module.exports = mongoose.model('Test', TestSchema);
