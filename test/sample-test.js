const { ethers } = require("hardhat");

it("good stack trace", async function () {
  const B = await ethers.getContractFactory("B");
  const b = await B.deploy();
  await b.testGood();
});

it("bad stack trace", async function () {
  const B = await ethers.getContractFactory("B");
  const b = await B.deploy();
  await b.testBad();
});
