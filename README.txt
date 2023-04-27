REMIX DEFAULT WORKSPACE

Remix default workspace is present when:
i. Remix loads for the very first time 
ii. A new workspace is created with 'Default' template
iii. There are no files existing in the File Explorer

This workspace contains 3 directories:

1. 'contracts': Holds three contracts with increasing levels of complexity.
2. 'scripts': Contains four typescript files to deploy a contract. It is explained below.
3. 'tests': Contains one Solidity test file for 'Ballot' contract & one JS test file for 'Storage' contract.

SCRIPTS

The 'scripts' folder has four typescript files which help to deploy the 'Storage' contract using 'web3.js' and 'ethers.js' libraries.

For the deployment of any other contract, just update the contract's name from 'Storage' to the desired contract and provide constructor arguments accordingly 
in the file `deploy_with_ethers.ts` or  `deploy_with_web3.ts`

In the 'tests' folder there is a script containing Mocha-Chai unit tests for 'Storage' contract.

To run a script, right click on file name in the file explorer and click 'Run'. Remember, Solidity file must already be compiled.
Output from script will appear in remix terminal.

Please note, require/import is supported in a limited manner for Remix supported modules.
For now, modules supported by Remix are ethers, web3, swarmgw, chai, multihashes, remix and hardhat only for hardhat.ethers object/plugin.
For unsupported modules, an error like this will be thrown: '<module_name> module require is not supported by Remix IDE' will be shown.


#강의에 참고했던 사이트 _ 파트7의 1챕터 2번 실제 프로젝트에 쓰인 스마트 컨트랙트 간단히 보기(유니스왑)

1) 유니스왑 V3: https://github.com/Uniswap/v3-core
2) 위메이드: https://github.com/wemade-tree/wemix-token (erc-20) / https://github.com/wemade-tree/wemix-token/tree/dev/contracts
3) 클레이튼: https://docs.klaytn.foundation/content/smart-contract/sample-contracts/erc-20/1-erc20 (erc-20)

#솔리디티 학습에 도움되는 사이트 _ 파트7의 챕터5 마무리 
1) https://docs.soliditylang.org/en/latest/index.html (솔리디티 독스)
2) https://ethereum.stackexchange.com/questions (솔리디티 질문)
3) https://stackoverflow.com/questions (솔리디티 질문 - 스택 오버플로우)
4) https://docs.openzeppelin.com/contracts/4.x/crosschain (컨트랙트 표준-오픈 제플린) 

