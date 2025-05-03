const { ethers } = require('hardhat')

async function main() {
  //   const mediTokenAddress = '0xEa47D818C993D541F71B7BA03098E009c69DEcce'

  const ProposalFactory = await ethers.getContractFactory('ProposalFactory')
  const proposalFactory = await ProposalFactory.deploy()

  // ✅ Wait for deployment to finish
  await proposalFactory.waitForDeployment()

  console.log(
    `ElectionFactory deployed to: ${await proposalFactory.getAddress()}`
  )
}

main().catch((error) => {
  console.error(error)
  process.exitCode = 1
})
