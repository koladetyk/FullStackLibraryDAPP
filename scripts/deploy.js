import { writeFileSync } from 'fs';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';

// Get the equivalent of __dirname in ES modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

async function main() {
  
    const LibraryFactory = await ethers.getContractFactory("Library");
    const library = await LibraryFactory.deploy();
    await library.deployed();

    const deploymentInfo = {
      libraryAddress: library.address
    };

    writeFileSync(
      join(__dirname, '../src/contractInfo.json'),
      JSON.stringify(deploymentInfo, null, 2)
    );
  
    console.log("Library contract deployed to:", library.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  