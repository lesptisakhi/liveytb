const express = require("express");
const fs = require("fs");
const app = express();

app.get("/", (req, res) => {
  res.send("<h1>LiveYT Stats</h1><p>Visitez /stats pour voir les logs.</p>");
});

app.get("/stats", (req, res) => {
  fs.readFile("logs.txt", "utf8", (err, data) => {
    if (err) return res.send("Aucun log disponible.");
    const lines = data.split("\n").slice(-50).join("<br>");
    res.send(`
      <h2>Dernières lignes du live</h2>
      <div style="font-family: monospace; white-space: pre-wrap;">${lines}</div>
    `);
  });
});

app.listen(10000, () => console.log("Stats server running on port 10000"));
