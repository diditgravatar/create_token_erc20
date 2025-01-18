// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Membuat kontrak token ERC-20
contract MyToken is ERC20, Ownable {
    // Menyimpan alamat untuk router DEX (misalnya, Uniswap di Ethereum atau PancakeSwap di BSC)
    address public liquidityPool;

    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        // Menambahkan supply token yang akan dicetak saat deploy
        _mint(msg.sender, initialSupply);
    }

    // Fungsi untuk menambahkan liquidity ke DEX
    function setLiquidityPool(address _pool) external onlyOwner {
        liquidityPool = _pool;
    }

    // Fungsi mint untuk mencetak token tambahan
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
