import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const TokenModule = buildModule("TokenModule", (m) => {
  
  const ownerAddress = "0x8F4F05d64D6d670899a7EA9427900Aa98AC6b0E8";
  const token = m.contract("Token", [ownerAddress]);

  return { token };

});

export default TokenModule;
