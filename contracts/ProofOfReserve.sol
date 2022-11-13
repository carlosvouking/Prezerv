// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract ProofOfReserve {
    /** Declarin Types */
    AggregatorV3Interface internal supplySTBcoin;
    AggregatorV3Interface internal reservesSTBcoin;

    /**
     * Network: Goerli Testnet
     * Aggregator: Swell PoR
     * Address: 0xDe9C980F79b636B46b9c3bc04cfCC94A29D18D19
     */

    /**State variables */
    /**Events */

    /**Functions */
    constructor() {
        // initializin the 2 feeds with the correspondin flux address

        // feed providin the current supply of STBcoin...stablecoin quantity in circulation
        //supplySTBcoin = AggregatorV3Interface();

        // feed showin the curent reserves backin the STBcoin
        reservesSTBcoin = AggregatorV3Interface(0xDe9C980F79b636B46b9c3bc04cfCC94A29D18D19);
    }

    // retrieve the last supply information
    // function getLatestSupplyOfSTBcoin() public view returns (int256) {
    //     (
    //         ,
    //         /*uint80 roundID*/
    //         int256 supply, /*uint startedAt*/ /*uint updatedAt*/ /*uint80 answeredInRound*/
    //         ,
    //         ,

    //     ) = supplySTBcoin.latestRoundData();
    //     return supply;
    // }

    // retrieve the current reserve data
    function getLatestReservesOfSTBcoin() public view returns (int256) {
        (
            ,
            /*uint80 roundID*/
            int256 reserve, /*uint256 startedAt*/ /*uint256 updatedAt*/ /*uint80 answeredInRound*/
            ,
            ,

        ) = reservesSTBcoin.latestRoundData();
        return reserve;
    }

    // As we have the supply and the reserve, now we check if the reserve outnumbers the supply:
    //...which will means that the STBcoin covered by the reserve thus fully collateralized and healthy.
    // Rule: Spply should never exceeds the Reserve
    function IsSTBcoinHealthy() public view returns (bool) {
        //return getLatestReservesOfSTBcoin() >= getLatestSupplyOfSTBcoin(); // expectin true
    }
}
