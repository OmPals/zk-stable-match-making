/* eslint-disable node/no-missing-import */
/* eslint-disable camelcase */
import { expect } from "chai";
import { BigNumber } from "ethers";
// eslint-disable-next-line node/no-extraneous-import
import { ZKPClient, EdDSA } from "circuits";
import fs from "fs";
import path from "path";

describe("Test stable match making - smm", function () {
  beforeEach(async () => {
    const wasm = fs.readFileSync(
      path.join(__dirname, "../../circuits/zk/circuits/smm_js/smm.wasm")
    );
    const zkey = fs.readFileSync(
      path.join(__dirname, "../../circuits/zk/zkeys/smm.zkey")
    );
  });
});
