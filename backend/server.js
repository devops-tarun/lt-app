const express = require('express');
const mongoose = require('mongoose');
const Test = require('./models/Test');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());

mongoose.connect('mongodb://localhost:27017/testdb', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
}).then(() => console.log("MongoDB connected"));

app.get('/api', async (req, res) => {
  const message = await Test.findOne();
  if (!message) {
    const newMsg = new Test({ message: 'Hello from the MERN backend!' });
    await newMsg.save();
    return res.json({ message: newMsg.message });
  }
  res.json({ message: message.message });
});

const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
