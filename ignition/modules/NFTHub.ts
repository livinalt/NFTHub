import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const NFTHubModule = buildModule("NFTHubModule", (m) => {

  const paymentToken = "0x02ad606e51A73A68e987C5cFF626EcDb67E86B44";

  const nFTHub = m.contract("NFTHub", [paymentToken]);

  return { nFTHub };

});

export default NFTHubModule;

