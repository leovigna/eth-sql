const { writeFileSync, readFileSync, mkdirSync, existsSync } = require("fs");
const { execSync } = require("child_process");

const postinstall = () => {
    execSync(`npm run compile`);


    const ColumnBase = JSON.parse(readFileSync('../src/contracts/build/ColumnBase.json'))
    const TableBase = JSON.parse(readFileSync('../src/contracts/build/TableBase.json'))
    const ORMBase = JSON.parse(readFileSync('../src/contracts/build/ORMBase.json'))

    const dir = '../src/contracts/abi'
    !existsSync(dir) && mkdirSync(dir);

    writeFileSync('../src/contracts/abi/ColumnBase.json', JSON.stringify(ColumnBase.abi))
    writeFileSync('../src/contracts/abi/TableBase.json', JSON.stringify(TableBase.abi))
    writeFileSync('../src/contracts/abi/ORMBase.json', JSON.stringify(ORMBase.abi))

    execSync(`npm run typechain`);

};

try {
    postinstall();
} catch (error) {
    console.error(error);
}
