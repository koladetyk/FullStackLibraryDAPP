// hardhat.config.js

require("dotenv").config()
require("@nomiclabs/hardhat-ethers")
 
module.exports = {
  solidity: "0.8.6",
  paths: {
    artifacts: './src/artifacts',
  },
  networks: {
    ganache: {
      url: process.env.PROVIDER_URL,
      // accounts: [`0x` + process.env.PRIVATE_KEY],
      chainId: 1337,
    },
  },
}
